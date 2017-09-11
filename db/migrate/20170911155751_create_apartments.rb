class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :country
      t.integer :price
      t.string :apartment_type
      t.string :amenities
      t.integer :number_of_guests
      t.integer :number_of_bedrooms
      t.integer :number_of_bathrooms
      t.integer :number_of_beds
      t.time :checkin_time
      t.time :checkout_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
