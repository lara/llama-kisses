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

ActiveRecord::Schema.define(version: 20170805200511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "llama_ranches", force: :cascade do |t|
    t.float "lat", null: false
    t.float "long", null: false
    t.string "street", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lat"], name: "index_llama_ranches_on_lat", unique: true
    t.index ["long"], name: "index_llama_ranches_on_long", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "kiss_count", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.string "stripe_charge_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["product_id"], name: "index_purchases_on_product_id"
    t.index ["stripe_charge_id"], name: "index_purchases_on_stripe_charge_id", unique: true
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "redemptions", force: :cascade do |t|
    t.integer "kisses_redeemed", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_redemptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "oauth_id", null: false
    t.string "oauth_token", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["oauth_id"], name: "index_users_on_oauth_id", unique: true
  end

  add_foreign_key "purchases", "products"
  add_foreign_key "purchases", "users"
  add_foreign_key "redemptions", "users"
end
