# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150414223445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "abreviation"
    t.string "name"
  end

  create_table "courses_internships", force: :cascade do |t|
    t.integer "course_id"
    t.integer "internship_id"
  end

  add_index "courses_internships", ["course_id"], name: "index_courses_internships_on_course_id", using: :btree
  add_index "courses_internships", ["internship_id"], name: "index_courses_internships_on_internship_id", using: :btree

  create_table "courses_notices", force: :cascade do |t|
    t.integer "course_id"
    t.integer "notice_id"
  end

  add_index "courses_notices", ["course_id"], name: "index_courses_notices_on_course_id", using: :btree
  add_index "courses_notices", ["notice_id"], name: "index_courses_notices_on_notice_id", using: :btree

  create_table "enterprises", force: :cascade do |t|
    t.string "fantasy_name"
    t.string "corporate_name"
    t.string "site"
  end

  create_table "internships", force: :cascade do |t|
    t.date    "publication_time"
    t.integer "enterprise_id"
    t.date    "start_date"
    t.date    "end_date"
    t.text    "requirements"
    t.integer "semester"
    t.text    "benefits"
    t.integer "access"
    t.text    "observation"
  end

  add_index "internships", ["enterprise_id"], name: "index_internships_on_enterprise_id", using: :btree

  create_table "notices", force: :cascade do |t|
    t.date    "publication_time"
    t.string  "title"
    t.string  "reference"
    t.string  "picture"
    t.text    "description"
    t.integer "access"
  end

  add_foreign_key "courses_internships", "courses"
  add_foreign_key "courses_internships", "internships"
  add_foreign_key "courses_notices", "courses"
  add_foreign_key "courses_notices", "notices"
  add_foreign_key "internships", "enterprises"
end
