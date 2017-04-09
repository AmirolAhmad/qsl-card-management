class CallsignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_callsign, only: [:show, :edit, :update, :destroy]

  def index
    @callsigns = current_user.callsigns
  end

  def show
  end

  def new
    @callsign = Callsign.new
  end

  def edit
  end

  def create
    @callsign = current_user.callsigns.new(callsign_params)

    respond_to do |format|
      if @callsign.save
        format.html { redirect_to @callsign, notice: 'Callsign was successfully created.' }
        format.json { render :show, status: :created, location: @callsign }
      else
        format.html { render :new }
        format.json { render json: @callsign.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @callsign.update(callsign_params)
        format.html { redirect_to @callsign, notice: 'Callsign was successfully updated.' }
        format.json { render :show, status: :ok, location: @callsign }
      else
        format.html { render :edit }
        format.json { render json: @callsign.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @callsign.destroy
    respond_to do |format|
      format.html { redirect_to callsigns_url, notice: 'Callsign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_callsign
      @callsign = current_user.callsigns.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to(callsigns_url, :notice => 'Record not found')
    end

    def callsign_params
      params.require(:callsign).permit(:user_id, :callsign)
    end
end
