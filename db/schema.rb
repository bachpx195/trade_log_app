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

ActiveRecord::Schema.define(version: 20180515003366) do

  create_table "brokers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "result",             default: 0
    t.integer  "symbol_category_id"
    t.datetime "time"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["symbol_category_id"], name: "index_candles_on_symbol_category_id", using: :btree
  end

  create_table "cookie_tools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "cookie_str", limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "adress"
    t.float    "money",      limit: 24
    t.datetime "datetime"
    t.integer  "status",                default: 0, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "symbol_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "broker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["broker_id"], name: "index_symbol_categories_on_broker_id", using: :btree
  end

  add_foreign_key "candles", "symbol_categories"
  add_foreign_key "symbol_categories", "brokers"
end
