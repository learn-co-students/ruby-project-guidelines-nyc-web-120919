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

ActiveRecord::Schema.define(version: 20200102205358) do

  create_table "meetings", force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.string  "date"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "room_id"
    t.string  "date"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "room_number"
    t.integer "number_of_seats"
  end

  create_table "students", force: :cascade do |t|
    t.string  "name"
    t.integer "grade"
    t.float   "gpa"
    t.integer "disciplinary_marks"
    t.string  "club"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.string "club"
  end

end
