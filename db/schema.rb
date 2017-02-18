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

ActiveRecord::Schema.define(version: 20170218152630) do

  create_table "markets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_data", force: :cascade do |t|
    t.string   "date"
    t.decimal  "assets",            precision: 15, scale: 3
    t.decimal  "liabilities",       precision: 15, scale: 3
    t.decimal  "equity",            precision: 15, scale: 3
    t.decimal  "paid_up_capital",   precision: 15, scale: 3
    t.decimal  "revenue",           precision: 15, scale: 3
    t.decimal  "net_profit",        precision: 15, scale: 3
    t.decimal  "eps",               precision: 15, scale: 3
    t.decimal  "roa",               precision: 15, scale: 3
    t.decimal  "roe",               precision: 15, scale: 3
    t.decimal  "last_price",        precision: 15, scale: 3
    t.decimal  "market_cap",        precision: 15, scale: 3
    t.decimal  "pe",                precision: 15, scale: 3
    t.decimal  "pbv",               precision: 15, scale: 3
    t.decimal  "book_value",        precision: 15, scale: 3
    t.decimal  "dividend_yield",    precision: 15, scale: 3
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "stock_id"
    t.decimal  "net_profit_margin", precision: 15, scale: 3
  end

  add_index "stock_data", ["stock_id"], name: "index_stock_data_on_stock_id"

  create_table "stocks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "market_id"
    t.string   "market_area"
    t.string   "symbol"
  end

  add_index "stocks", ["market_id"], name: "index_stocks_on_market_id"

end
