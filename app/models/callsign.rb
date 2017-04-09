class Callsign < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  has_many :tracks

  friendly_id :callsign, use: [:slugged, :finders, :history]

  def should_generate_new_friendly_id?
    callsign_changed?
  end
end
