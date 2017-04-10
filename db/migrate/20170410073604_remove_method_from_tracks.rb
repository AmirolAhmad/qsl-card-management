class RemoveMethodFromTracks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tracks, :method, :integer
    add_column :tracks, :method, :string
  end
end
