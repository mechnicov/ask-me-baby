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

ActiveRecord::Schema.define(version: 2019_03_04_103244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hashtags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_hashtags_on_name", unique: true
  end

  create_table "hashtags_questions", id: false, force: :cascade do |t|
    t.bigint "hashtag_id", null: false
    t.bigint "question_id", null: false
    t.index ["hashtag_id", "question_id"], name: "index_hashtags_questions_on_hashtag_id_and_question_id", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "author_id"
    t.index ["author_id"], name: "index_questions_on_author_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
    t.string "avatar_url"
    t.string "bgcolor"
    t.string "fontcolor"
    t.string "bordercolor"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "questions", "users"
end
