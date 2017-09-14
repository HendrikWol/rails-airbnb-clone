# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170914130115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.boolean "wifi"
    t.boolean "kitchen"
    t.boolean "gym"
    t.boolean "pool"
    t.boolean "tv"
    t.boolean "pets_allowed"
    t.boolean "smoking_allowed"
    t.boolean "shampoo"
    t.boolean "air_condition"
    t.boolean "heating"
    t.boolean "hair_dryer"
    t.bigint "apartment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_amenities_on_apartment_id"
  end

  create_table "apartments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.string "city"
    t.string "country"
    t.integer "price"
    t.string "apartment_type"
    t.integer "number_of_guests"
    t.integer "number_of_bedrooms"
    t.integer "number_of_bathrooms"
    t.integer "number_of_beds"
    t.time "checkin_time"
    t.time "checkout_time"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_apartments_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "total_price"
    t.string "status"
    t.bigint "apartment_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.index ["apartment_id"], name: "index_bookings_on_apartment_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "phone_number"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "booking_id"
    t.bigint "apartment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_reviews_on_apartment_id"
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "amenities", "apartments"
  add_foreign_key "apartments", "users"
  add_foreign_key "bookings", "apartments"
  add_foreign_key "bookings", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "apartments"
  add_foreign_key "reviews", "bookings"
end
