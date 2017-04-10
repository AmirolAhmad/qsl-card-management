class Track < ApplicationRecord
  enum status: [:pending, :complete]
  belongs_to :callsign

  validates_presence_of :call, :method
  validates_presence_of :date_in, if: :tks?
  validates_presence_of :date_out, if: :pse?

  def tks?
    self.method == 'TKS'
  end

  def pse?
    self.method == 'PSE'
  end

  METHOD_OPTIONS = [
    ["TKS QSL", "TKS"],
    ["PSE QSL", "PSE"]
  ]
end
