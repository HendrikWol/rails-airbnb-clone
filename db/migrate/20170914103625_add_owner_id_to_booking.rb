class AddOwnerIdToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :owner_id, :integer
  end
end
