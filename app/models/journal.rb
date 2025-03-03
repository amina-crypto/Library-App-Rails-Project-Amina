class Journal < ApplicationRecord
  validates :title, :volume, :issue, :language, :publish_year, presence: true

  scope :search, ->(query) { where("title ILIKE ?", "%#{query}%") }
  scope :by_category, ->(category) { where(category: category) }

  enum :category, %i[
    Academic
    Historic
    Popular
  ]

  has_one :reservation, dependent: :destroy

  def available?
    reservation.nil? || reservation.reservation_expired?
  end
end
