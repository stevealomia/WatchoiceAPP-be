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

ActiveRecord::Schema[7.0].define(version: 2022_06_21_063121) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "watch_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
    t.index ["watch_model_id"], name: "index_favorites_on_watch_model_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "watch_brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watch_families", force: :cascade do |t|
    t.bigint "watch_brand_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["watch_brand_id"], name: "index_watch_families_on_watch_brand_id"
  end

  create_table "watch_models", force: :cascade do |t|
    t.bigint "watch_family_id", null: false
    t.integer "watch_id"
    t.string "name"
    t.integer "market_price"
    t.string "limited"
    t.jsonb "case"
    t.jsonb "dial"
    t.jsonb "movement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.index ["watch_family_id"], name: "index_watch_models_on_watch_family_id"
    t.index ["watch_id"], name: "index_watch_models_on_watch_id"
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "favorites", "watch_models"
  add_foreign_key "watch_families", "watch_brands"
  add_foreign_key "watch_models", "watch_families"
end
