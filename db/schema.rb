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

ActiveRecord::Schema[7.0].define(version: 2024_01_24_051601) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "angel_models", force: :cascade do |t|
    t.string "name"
    t.json "pdf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "angels", force: :cascade do |t|
    t.string "name"
    t.json "pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "popcorns", force: :cascade do |t|
    t.string "popcornable_type"
    t.bigint "popcornable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["popcornable_type", "popcornable_id"], name: "index_popcorns_on_popcornable"
  end

  create_table "posters", force: :cascade do |t|
    t.json "image"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "nickname"
    t.boolean "is_admin"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "yans", force: :cascade do |t|
    t.string "name"
    t.json "pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "youths", force: :cascade do |t|
    t.string "name"
    t.json "pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
