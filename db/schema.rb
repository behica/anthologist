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

ActiveRecord::Schema.define(version: 20170802112305) do

  create_table "achievements", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "achievements", ["badge_id"], name: "index_achievements_on_badge_id"
  add_index "achievements", ["user_id"], name: "index_achievements_on_user_id"

  create_table "badges", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "points"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "collections", ["story_id"], name: "index_collections_on_story_id"
  add_index "collections", ["user_id"], name: "index_collections_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "story_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["story_id"], name: "index_comments_on_story_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "purchases", ["story_id"], name: "index_purchases_on_story_id"
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ratings", ["story_id"], name: "index_ratings_on_story_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "author"
    t.string   "genre"
    t.boolean  "published",                                  default: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "user_id"
    t.decimal  "price",              precision: 8, scale: 2
    t.integer  "tier"
  end

  add_index "stories", ["user_id"], name: "index_stories_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
