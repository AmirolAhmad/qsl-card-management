class CreateCallsigns < ActiveRecord::Migration[5.0]
  def change
    create_table :callsigns do |t|
      t.belongs_to :user, foreign_key: true
      t.string :callsign, null: false, default: ""

      t.timestamps
    end
    add_index :callsigns, :callsign, unique: true
  end
end
