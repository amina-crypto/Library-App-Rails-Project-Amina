class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book, optional: true
  belongs_to :journal, optional: true

  validates :due_date, presence: true

  def fine
    if due_date < Time.current
      late_days = (Time.current - due_date).to_i / 86400
      [late_days * 50, 500].min
    else
      0
    end
  end
end
