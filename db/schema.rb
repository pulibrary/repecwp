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

ActiveRecord::Schema.define(version: 20160118044003) do

  create_table "papers", force: :cascade do |t|
    t.string   "title"
    t.string   "author1first"
    t.string   "author1mid"
    t.string   "author1last"
    t.string   "author1workplace"
    t.string   "author2first"
    t.string   "author2mid"
    t.string   "author2last"
    t.string   "author2workplace"
    t.string   "author3first"
    t.string   "author3mid"
    t.string   "author3last"
    t.string   "author3workplace"
    t.string   "author4first"
    t.string   "author4mid"
    t.string   "author4last"
    t.string   "author4workplace"
    t.string   "author5first"
    t.string   "author5mid"
    t.string   "author5last"
    t.string   "author5workplace"
    t.text     "abstract"
    t.string   "creationdate"
    t.string   "sectionurlid"
    t.string   "papernumber"
    t.string   "filefunction"
    t.string   "jel"
    t.string   "keywords"
    t.boolean  "suppress"
    t.integer  "wpid"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"
  add_index "users", ["username"], name: "index_users_on_username"

end
