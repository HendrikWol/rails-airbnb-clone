class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.boolean :wifi
      t.boolean :kitchen
      t.boolean :gym
      t.boolean :pool
      t.boolean :tv
      t.boolean :pets_allowed
      t.boolean :smoking_allowed
      t.boolean :shampoo
      t.boolean :air_condition
      t.boolean :heating
      t.boolean :hair_dryer
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
