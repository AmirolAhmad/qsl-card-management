class Track < ApplicationRecord
enum method: [:tks, :pse]
enum status: [:pending, :complete]
  belongs_to :callsign
end
