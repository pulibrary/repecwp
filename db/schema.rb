# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2016_03_04_181821) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "archives", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.text "description"
    t.string "handle"
    t.string "maintainer_email"
    t.string "name"
    t.datetime "updated_at", precision: nil, null: false
    t.string "url"
  end

  create_table "papers", id: :serial, force: :cascade do |t|
    t.text "abstract"
    t.string "author1first"
    t.string "author1last"
    t.string "author1mid"
    t.string "author1workplace"
    t.string "author2first"
    t.string "author2last"
    t.string "author2mid"
    t.string "author2workplace"
    t.string "author3first"
    t.string "author3last"
    t.string "author3mid"
    t.string "author3workplace"
    t.string "author4first"
    t.string "author4last"
    t.string "author4mid"
    t.string "author4workplace"
    t.string "author5first"
    t.string "author5last"
    t.string "author5mid"
    t.string "author5workplace"
    t.datetime "created_at", precision: nil, null: false
    t.string "creationdate"
    t.string "filefunction"
    t.string "jel"
    t.string "keywords"
    t.string "papernumber"
    t.string "sectionurlid"
    t.integer "series_id"
    t.boolean "suppress"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
    t.string "url"
    t.integer "wpid"
    t.index ["series_id"], name: "index_papers_on_series_id"
  end

  create_table "series", id: :serial, force: :cascade do |t|
    t.string "base_url"
    t.datetime "created_at", precision: nil, null: false
    t.string "handle"
    t.string "maintainer_email"
    t.string "maintainer_name"
    t.string "name"
    t.string "pri_handle"
    t.string "provider_homepage"
    t.string "provider_institution"
    t.string "provider_name"
    t.string "sectionurlid"
    t.string "series_type"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_sign_in_at", precision: nil
    t.string "last_sign_in_ip"
    t.string "provider"
    t.datetime "remember_created_at", precision: nil
    t.datetime "reset_password_sent_at", precision: nil
    t.string "reset_password_token"
    t.string "role"
    t.integer "sign_in_count", default: 0, null: false
    t.string "uid"
    t.datetime "updated_at", precision: nil, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "papers", "series"
end
