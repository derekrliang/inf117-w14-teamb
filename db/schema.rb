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

ActiveRecord::Schema.define(version: 20140324230023) do

  create_table "announcements", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content"
    t.integer  "course_id"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image_url"
    t.text     "good_example1"
    t.text     "good_example2"
    t.text     "good_example3"
    t.text     "bad_example1"
    t.text     "bad_example2"
    t.text     "bad_example3"
  end

  create_table "courses", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
  end

  create_table "questions", force: true do |t|
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "good_example"
    t.string   "bad_example"
  end

  create_table "responses", force: true do |t|
    t.text     "sentence1",               limit: 255
    t.text     "sentence2",               limit: 255
    t.text     "sentence3",               limit: 255
    t.integer  "question_id"
    t.integer  "user_id"
    t.integer  "reviewer_id"
    t.text     "revised_sentence1",       limit: 255
    t.text     "revised_sentence2",       limit: 255
    t.text     "revised_sentence3",       limit: 255
    t.integer  "best_sentence"
    t.integer  "worst_sentence"
    t.text     "best_sentence_feedback",  limit: 255
    t.text     "worst_sentence_feedback", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "responses", ["category_id"], name: "index_responses_on_category_id"
  add_index "responses", ["user_id"], name: "index_responses_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "course_id"
  end

end
