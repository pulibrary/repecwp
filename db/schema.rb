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

ActiveRecord::Schema.define(version: 20160304181821) do

  create_table "archives", force: :cascade do |t|
    t.string   "handle",           limit: 255
    t.string   "name",             limit: 255
    t.string   "maintainer_email", limit: 255
    t.text     "description",      limit: 65535
    t.string   "url",              limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.string   "author1first",     limit: 255
    t.string   "author1mid",       limit: 255
    t.string   "author1last",      limit: 255
    t.string   "author1workplace", limit: 255
    t.string   "author2first",     limit: 255
    t.string   "author2mid",       limit: 255
    t.string   "author2last",      limit: 255
    t.string   "author2workplace", limit: 255
    t.string   "author3first",     limit: 255
    t.string   "author3mid",       limit: 255
    t.string   "author3last",      limit: 255
    t.string   "author3workplace", limit: 255
    t.string   "author4first",     limit: 255
    t.string   "author4mid",       limit: 255
    t.string   "author4last",      limit: 255
    t.string   "author4workplace", limit: 255
    t.string   "author5first",     limit: 255
    t.string   "author5mid",       limit: 255
    t.string   "author5last",      limit: 255
    t.string   "author5workplace", limit: 255
    t.text     "abstract",         limit: 65535
    t.string   "creationdate",     limit: 255
    t.string   "sectionurlid",     limit: 255
    t.string   "papernumber",      limit: 255
    t.string   "filefunction",     limit: 255
    t.string   "jel",              limit: 255
    t.string   "keywords",         limit: 255
    t.boolean  "suppress"
    t.integer  "wpid",             limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "series_id",        limit: 4
    t.string   "url",              limit: 255
  end

  add_index "papers", ["series_id"], name: "index_papers_on_series_id", using: :btree

  create_table "series", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "provider_name",        limit: 255
    t.string   "provider_homepage",    limit: 255
    t.string   "provider_institution", limit: 255
    t.string   "maintainer_name",      limit: 255
    t.string   "maintainer_email",     limit: 255
    t.string   "series_type",          limit: 255
    t.string   "handle",               limit: 255
    t.string   "sectionurlid",         limit: 255
    t.string   "base_url",             limit: 255
    t.string   "pri_handle",           limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "username",               limit: 255
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  add_foreign_key "papers", "series"
end
