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

ActiveRecord::Schema.define(version: 20160822104121) do

  create_table "shopping_cart_addresses", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.integer  "zipcode"
    t.string   "city"
    t.string   "phone"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_shopping_cart_addresses_on_country_id"
  end

  create_table "shopping_cart_countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_credit_cards", force: :cascade do |t|
    t.string   "number"
    t.integer  "cvv"
    t.string   "expiration_month"
    t.integer  "expiration_year"
    t.integer  "order_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["order_id"], name: "index_shopping_cart_credit_cards_on_order_id"
  end

  create_table "shopping_cart_deliveries", force: :cascade do |t|
    t.string   "company"
    t.string   "delivery_method"
    t.float    "price"
    t.integer  "order_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["order_id"], name: "index_shopping_cart_deliveries_on_order_id"
  end

  create_table "shopping_cart_order_items", force: :cascade do |t|
    t.float    "price"
    t.integer  "quantity"
    t.integer  "order_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_shopping_cart_order_items_on_item_id"
    t.index ["order_id"], name: "index_shopping_cart_order_items_on_order_id"
  end

  create_table "shopping_cart_orders", force: :cascade do |t|
    t.string   "state"
    t.float    "total_price"
    t.datetime "completed_date"
    t.string   "user_type"
    t.integer  "user_id"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.integer  "coupon_id"
    t.integer  "delivery_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["billing_address_id"], name: "index_shopping_cart_orders_on_billing_address_id"
    t.index ["coupon_id"], name: "index_shopping_cart_orders_on_coupon_id"
    t.index ["delivery_id"], name: "index_shopping_cart_orders_on_delivery_id"
    t.index ["shipping_address_id"], name: "index_shopping_cart_orders_on_shipping_address_id"
    t.index ["user_type", "user_id"], name: "index_shopping_cart_orders_on_user_type_and_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
