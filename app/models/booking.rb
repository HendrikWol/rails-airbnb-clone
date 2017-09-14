class Booking < ApplicationRecord
  belongs_to :apartment
  belongs_to :user
  has_one :review

  before_validation :set_defaults

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true
  validates :status, presence: true

  private

  def set_defaults
    self.status = 'Pending' if status.nil?
    self.total_price = 0 if total_price.nil?
  end

end
