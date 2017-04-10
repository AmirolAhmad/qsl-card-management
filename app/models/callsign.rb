class Callsign < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  has_many :tracks, dependent: :destroy

  friendly_id :callsign, use: [:slugged, :finders, :history]

  validates_presence_of :callsign

  def should_generate_new_friendly_id?
    callsign_changed?
  end
end
