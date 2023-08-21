class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :theatre
  belongs_to :movie


  validates :movie_id , presence: true
  validates :theatre_id , presence: true
  validates :number_of_tickets , presence: true

  before_save :ticket_id

  def ticket_id
    self.alphanumeric_id = SecureRandom.hex[0..8]
  end
end
