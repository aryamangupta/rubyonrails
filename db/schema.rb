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

ActiveRecord::Schema.define(version: 20150121142130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.text     "caption"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  add_index "pictures", ["product_id"], name: "index_pictures_on_product_id", using: :btree

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
  end

  add_foreign_key "pictures", "products"
end
