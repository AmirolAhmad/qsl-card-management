class AddSlugToCallsign < ActiveRecord::Migration[5.0]
  def change
    add_column :callsigns, :slug, :string
    add_index :callsigns, :slug, unique: true
  end
end
