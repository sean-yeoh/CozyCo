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

ActiveRecord::Schema.define(version: 20161213152623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "credits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.integer  "cents"
    t.integer  "escrow_amount"
    t.integer  "escrow_cents"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "credits", ["user_id"], name: "index_credits_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.date     "event_date"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "listing_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_type_id"
    t.string   "photo"
    t.string   "text"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "amount"
    t.integer  "cents"
  end

  add_index "listings", ["listing_type_id"], name: "index_listings_on_listing_type_id", using: :btree
  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "notices", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.date     "expiry_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "payment_method"
    t.string   "nonce"
    t.integer  "amount"
    t.integer  "cents"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.integer  "payment_id"
    t.string   "date",                    array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reservations", ["listing_id"], name: "index_reservations_on_listing_id", using: :btree
  add_index "reservations", ["payment_id"], name: "index_reservations_on_payment_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "email",                                      null: false
    t.string   "encrypted_password", limit: 128,             null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,             null: false
    t.string   "name"
    t.string   "resident_type"
    t.integer  "role",                           default: 0
    t.string   "unit_number"
    t.string   "photo"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "events", "users"
  add_foreign_key "listings", "listing_types"
  add_foreign_key "listings", "users"
  add_foreign_key "notices", "users"
  add_foreign_key "reservations", "listings"
  add_foreign_key "reservations", "payments"
  add_foreign_key "reservations", "users"
end
