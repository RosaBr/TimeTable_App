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

ActiveRecord::Schema.define(version: 20150305164237) do

  create_table "coursemodules", force: true do |t|
    t.string   "module_code"
    t.string   "module_name"
    t.string   "course_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "title"
  end

  create_table "events", force: true do |t|
    t.string   "description"
    t.date     "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.string   "title"
  end

  create_table "meetings", force: true do |t|
    t.integer  "group_involved"
    t.string   "meeting_name"
    t.string   "agenda"
    t.integer  "meeting_created_by"
    t.integer  "memberID1"
    t.integer  "memberID2"
    t.integer  "memberID3"
    t.integer  "memberID4"
    t.integer  "memberID5"
    t.integer  "memberID6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.datetime "end_time"
    t.date     "date"
    t.string   "title"
  end

  create_table "users", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.integer  "username",             limit: 255
    t.text     "password_digest"
    t.boolean  "email_confirmed"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "course_enrolled"
    t.string   "title"
  end

end
