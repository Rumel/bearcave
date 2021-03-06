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

ActiveRecord::Schema.define(version: 20131019042728) do

  create_table "movies", force: true do |t|
    t.string   "name"
    t.string   "imported_name"
    t.text     "content"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "adult"
    t.string   "backdrop_path"
    t.string   "imdb_id"
    t.string   "poster_path"
    t.integer  "runtime"
    t.date     "release_date"
    t.string   "tagline"
    t.integer  "tmdb_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
