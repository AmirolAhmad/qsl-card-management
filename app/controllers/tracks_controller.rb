class TracksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_callsign, only: [:index, :new, :show, :edit, :create, :update, :destroy, :complete]
  before_action :set_track, only: [:index, :show, :edit, :create, :update, :destroy, :complete]
  before_action :find_track, only: [:show, :edit, :update, :destroy, :complete]

  def index
  end

  def show
  end

  def new
    @track = Track.new
  end

  def edit
  end

  def create
    @track = @tracks.new(track_params)
    respond_to do |format|
      if @track.save
        format.html { redirect_to callsign_track_path(id:@track), notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to callsign_track_path(id:@track), notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to callsign_tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
    respond_to do |format|
      if @track.update(track_params)
        @track.update_attributes(status: 1)
        format.html { redirect_to callsign_track_path(id:@track), notice: 'Track was successfully mark as completed.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_callsign
      @callsign = current_user.callsigns.friendly.find params[:callsign_id]
      rescue ActiveRecord::RecordNotFound
        redirect_to callsigns_url, :notice => 'Record not found'
    end

    def set_track
      @tracks = Track.where(callsign_id: @callsign.id)
    end

    def find_track
      @track = @tracks.find params[:id]
      rescue ActiveRecord::RecordNotFound
        redirect_to callsign_tracks_url, :notice => 'Record not found'
    end

    def track_params
      params.require(:track).permit(:callsign_id, :method, :date_in, :date_out, :status, :call)
    end
end
