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

ActiveRecord::Schema.define(version: 2018_06_26_212330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cpf"
  end

  create_table "cards", force: :cascade do |t|
    t.string "holder_name"
    t.string "card_number"
    t.date "expiration_date"
    t.string "cvv"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

  create_table "payments", force: :cascade do |t|
    t.float "amount"
    t.string "payment_type"
    t.bigint "client_id"
    t.bigint "buyer_id"
    t.bigint "card_id"
    t.index ["buyer_id"], name: "index_payments_on_buyer_id"
    t.index ["card_id"], name: "index_payments_on_card_id"
    t.index ["client_id"], name: "index_payments_on_client_id"
  end

  add_foreign_key "payments", "buyers"
  add_foreign_key "payments", "cards"
  add_foreign_key "payments", "clients"
end
