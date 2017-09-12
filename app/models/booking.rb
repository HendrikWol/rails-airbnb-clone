class Booking < ApplicationRecord
  belongs_to :apartment
  belongs_to :user
  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true
  validates :status, presence: true

end
