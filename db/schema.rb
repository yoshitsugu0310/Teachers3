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

ActiveRecord::Schema.define(version: 20170911144723) do

  create_table "matches", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "student_id"
    t.integer "request"
    t.integer "adoption"
    t.integer "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "request_time1"
    t.datetime "request_time2"
    t.datetime "request_time3"
    t.datetime "appoint_time"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "review"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_reviews_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "sex"
    t.integer "post_number"
    t.integer "grade"
    t.string "station"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "japanese"
    t.integer "math"
    t.integer "science"
    t.integer "social"
    t.integer "english"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sex"
    t.integer "post_number"
    t.integer "japanese"
    t.integer "math"
    t.integer "social"
    t.integer "science"
    t.integer "english"
    t.string "university_name"
    t.integer "fee"
    t.text "appeal"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "status"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
