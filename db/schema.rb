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

ActiveRecord::Schema.define(version: 2021_09_06_170051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "account_number"
    t.string "bank_name"
    t.bigint "contributors_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contributors_id"], name: "index_accounts_on_contributors_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "token"
    t.datetime "expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pledges", force: :cascade do |t|
    t.integer "amount"
    t.bigint "contributors_id"
    t.bigint "projects_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contributors_id"], name: "index_pledges_on_contributors_id"
    t.index ["projects_id"], name: "index_pledges_on_projects_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "account_number"
    t.string "bank_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "amount_paid"
    t.string "reference"
    t.bigint "accounts_id"
    t.bigint "projects_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accounts_id"], name: "index_transactions_on_accounts_id"
    t.index ["projects_id"], name: "index_transactions_on_projects_id"
  end

  add_foreign_key "accounts", "contributors", column: "contributors_id"
  add_foreign_key "pledges", "contributors", column: "contributors_id"
  add_foreign_key "pledges", "projects", column: "projects_id"
  add_foreign_key "transactions", "accounts", column: "accounts_id"
  add_foreign_key "transactions", "projects", column: "projects_id"
end
