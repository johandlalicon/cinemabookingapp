# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_09_204632) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "screening_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seats"
    t.bigint "seating_id", null: false
    t.index ["screening_id"], name: "index_bookings_on_screening_id"
    t.index ["seating_id"], name: "index_bookings_on_seating_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cinemas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cinema_number", null: false
    t.bigint "mall_id"
    t.index ["mall_id"], name: "index_cinemas_on_mall_id"
  end

  create_table "malls", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_cinemas", default: 0
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mall_id", null: false
    t.index ["mall_id"], name: "index_movies_on_mall_id"
  end

  create_table "screenings", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "cinema_id", null: false
    t.bigint "timeslot_id", null: false
    t.integer "seating_capacity", default: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_id"], name: "index_screenings_on_cinema_id"
    t.index ["movie_id"], name: "index_screenings_on_movie_id"
    t.index ["timeslot_id"], name: "index_screenings_on_timeslot_id"
  end

  create_table "seatings", force: :cascade do |t|
    t.bigint "screening_id", null: false
    t.string "seat_number"
    t.boolean "booked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["screening_id"], name: "index_seatings_on_screening_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.boolean "isAdmin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "screenings"
  add_foreign_key "bookings", "seatings"
  add_foreign_key "bookings", "users"
  add_foreign_key "cinemas", "malls", on_delete: :cascade
  add_foreign_key "movies", "malls"
  add_foreign_key "screenings", "cinemas", on_delete: :cascade
  add_foreign_key "screenings", "movies"
  add_foreign_key "screenings", "timeslots"
  add_foreign_key "seatings", "screenings"
end
