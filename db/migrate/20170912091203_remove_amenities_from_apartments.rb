class RemoveAmenitiesFromApartments < ActiveRecord::Migration[5.1]
  def change
    remove_column :apartments, :amenities
  end
end
