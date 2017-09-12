class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :apartment

  validates :rating, inclusion: { in: [1, 2, 3, 4, 5], allow_nil: false }
  validates :content, presence: true, length: { minimum: 10 }
end
