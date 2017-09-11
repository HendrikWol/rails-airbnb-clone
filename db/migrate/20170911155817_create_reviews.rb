class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :booking, foreign_key: true
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
