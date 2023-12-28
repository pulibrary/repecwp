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

ActiveRecord::Schema[7.0].define(version: 2016_03_04_181821) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archives", id: :serial, force: :cascade do |t|
    t.string "handle"
    t.string "name"
    t.string "maintainer_email"
    t.text "description"
    t.string "url"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "papers", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "author1first"
    t.string "author1mid"
    t.string "author1last"
    t.string "author1workplace"
    t.string "author2first"
    t.string "author2mid"
    t.string "author2last"
    t.string "author2workplace"
    t.string "author3first"
    t.string "author3mid"
    t.string "author3last"
    t.string "author3workplace"
    t.string "author4first"
    t.string "author4mid"
    t.string "author4last"
    t.string "author4workplace"
    t.string "author5first"
    t.string "author5mid"
    t.string "author5last"
    t.string "author5workplace"
    t.text "abstract"
    t.string "creationdate"
    t.string "sectionurlid"
    t.string "papernumber"
    t.string "filefunction"
    t.string "jel"
    t.string "keywords"
    t.boolean "suppress"
    t.integer "wpid"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "series_id"
    t.string "url"
    t.index ["series_id"], name: "index_papers_on_series_id"
  end

  create_table "series", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "provider_name"
    t.string "provider_homepage"
    t.string "provider_institution"
    t.string "maintainer_name"
    t.string "maintainer_email"
    t.string "series_type"
    t.string "handle"
    t.string "sectionurlid"
    t.string "base_url"
    t.string "pri_handle"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "papers", "series"
end
