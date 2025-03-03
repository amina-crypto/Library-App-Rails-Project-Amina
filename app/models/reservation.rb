class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book, optional: true
  belongs_to :journal, optional: true

  validates :expires_at, presence: true
  enum :status, %i[pending approved]

  def reservation_expired?
    expires_at < Time.current
  end
end
