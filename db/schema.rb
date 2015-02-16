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

ActiveRecord::Schema.define(version: 20150214142721) do

  create_table "categories", force: :cascade do |t|
    t.text     "subsubcategory"
    t.text     "subcategory"
    t.text     "category"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "business_type"
    t.string   "contact_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "address"
    t.string   "state"
    t.string   "country"
    t.string   "city"
    t.string   "pincode"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "buyer_email_id"
    t.integer  "seller_company_id"
    t.string   "seller_company_name"
    t.integer  "message_id"
    t.string   "product_name"
    t.float    "quantity"
    t.text     "comments"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.text     "caption"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  add_index "pictures", ["product_id"], name: "index_pictures_on_product_id"

  create_table "products", force: :cascade do |t|
    t.text     "ProductName"
    t.text     "ProductKeyword"
    t.integer  "ProductCategoryId"
    t.integer  "ProductSubCategory"
    t.integer  "ProductCategorization"
    t.text     "ModelNo"
    t.text     "BrandName"
    t.text     "MoreDetails"
    t.text     "MinimumOrder"
    t.text     "SupplyAbility"
    t.text     "QuotedPrice"
    t.text     "PaymentTerms"
    t.text     "DeliveryTime"
    t.text     "PackagingDetails"
    t.text     "DetailedDesciption"
    t.text     "Approved"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "category_id"
    t.integer  "company_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["company_id"], name: "index_products_on_company_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id"
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
