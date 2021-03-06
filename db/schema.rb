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

ActiveRecord::Schema.define(version: 20170823120155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "popup_activations", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "customer_id"
    t.string "ip"
    t.string "url"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "session_token"
    t.index ["session_token"], name: "index_popup_activations_on_session_token"
    t.index ["shop_id"], name: "index_popup_activations_on_shop_id"
  end

  create_table "popup_configs", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.boolean "desktop_enabled", default: false
    t.boolean "desktop_show_on_leave", default: false
    t.boolean "desktop_show_on_timeout", default: false
    t.integer "desktop_show_timeout", default: 15
    t.boolean "tablet_enabled", default: false
    t.boolean "tablet_show_on_leave", default: false
    t.boolean "tablet_show_on_timeout", default: false
    t.integer "tablet_show_timeout", default: 15
    t.integer "show_days_timeout", default: 30
    t.jsonb "uri_filters", default: []
    t.integer "version", default: 0
    t.integer "placement", default: 0
  end

  create_table "popup_submits", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.string "session_token"
    t.index ["session_token"], name: "index_popup_submits_on_session_token"
    t.index ["shop_id"], name: "index_popup_submits_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "shopify_script_tag_id"
    t.boolean "enabled", default: false
    t.index ["email"], name: "index_shops_on_email"
    t.index ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  create_table "slot_items", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.string "title"
    t.string "item_type"
    t.string "shopify_product_id"
    t.string "shopify_price_rule_id"
    t.string "coupon"
    t.string "image"
    t.string "product_url"
    t.index ["shop_id"], name: "index_slot_items_on_shop_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "plan_name"
    t.string "price"
    t.string "charge_id", null: false
    t.string "api_client_id", null: false
    t.string "status"
    t.string "billing_on"
    t.string "activated_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shop_id", null: false
  end

end
