class Apartment < ApplicationRecord
  # belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :amenity
  belongs_to :user

  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :apartment_type, presence: true, inclusion: { in: ["Entire home", "Private room", "Shared room"], allow_nil: false }
  validates :number_of_guests, presence: true
  validates :number_of_bedrooms, presence: true
  validates :number_of_bathrooms, presence: true
  validates :number_of_beds, presence: true
  validates :checkin_time, presence: true
  validates :checkout_time, presence: true
  validates :name, presence: true, length: { minimum: 8 }
  validates :description, presence: true

  mount_uploader :photo, PhotoUploader

end

