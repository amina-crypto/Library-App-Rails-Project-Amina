class Book < ApplicationRecord
  validates :title, :author, :language, :publish_year, presence: true
  
  scope :search, ->(query) { where("title ILIKE ?", "%#{query}%") }
  scope :by_category, ->(category) { where(category: category) }

  has_one :reservation, dependent: :destroy

  enum :category, %i[
    Fiction
    Romance
    Mystery
    Historical
    Biographical  
    Bildungsroman
    Science_Fiction
    Fantasy
  ]

  def available?
    reservation.nil? || reservation.reservation_expired?
  end
  
end
