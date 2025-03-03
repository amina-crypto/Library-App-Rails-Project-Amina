class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :surname, presence: true
  validates :email, presence: true, uniqueness: true

  enum :role, %i[library_user library_personnel]

  has_many :reservations, dependent: :destroy
  has_many :loans, dependent: :destroy
  
  scope :search, ->(query) { where("name ILIKE ?", "%#{query}%") }
end
