# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_24_025242) do

  create_table "carts", force: :cascade do |t|
    t.integer "total_amount"
    t.index "\"product_id\", \"productcart_id\"", name: "index_carts_on_product_id_and_productcart_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.index "\"product_id\"", name: "index_images_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "address"
    t.index "\"user_id\", \"cart_id\"", name: "index_orders_on_user_id_and_cart_id"
  end

  create_table "product_carts", force: :cascade do |t|
    t.integer "quantity"
    t.integer "total_product"
    t.index "\"product_id\", \"cart_id\"", name: "index_product_carts_on_product_id_and_cart_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name_product"
    t.text "information"
    t.integer "price"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rate"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "sum_rating"
    t.index "\"product_id\"", name: "index_ratings_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.date "birth"
    t.string "sex"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
  end

end
