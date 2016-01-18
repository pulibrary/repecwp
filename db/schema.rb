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

ActiveRecord::Schema.define(version: 20160118041718) do

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
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
