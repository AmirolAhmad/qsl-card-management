class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.belongs_to :callsign, foreign_key: true
      t.integer :method
      t.date :date_in
      t.date :date_out
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
