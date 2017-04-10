class AddCallToTrack < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :call, :string
  end
end
