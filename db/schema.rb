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

ActiveRecord::Schema.define(version: 2019_11_08_043823) do

  create_table "admin_tables", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_admin_tables_on_user_id"
  end

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "apartments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.decimal "bus_route"
    t.boolean "near_campus"
    t.string "building_near"
    t.index ["name"], name: "index_apartments_on_name", unique: true
  end

  create_table "metrics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "review_amenities", force: :cascade do |t|
    t.integer "amenity_id"
    t.integer "review_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["amenity_id"], name: "index_review_amenities_on_amenity_id"
    t.index ["review_id"], name: "index_review_amenities_on_review_id"
  end

  create_table "review_metrics", force: :cascade do |t|
    t.integer "review_id"
    t.integer "metric_id"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["metric_id"], name: "index_review_metrics_on_metric_id"
    t.index ["review_id"], name: "index_review_metrics_on_review_id"
  end

  create_table "review_tags", force: :cascade do |t|
    t.integer "review_id"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_review_tags_on_review_id"
    t.index ["tag_id"], name: "index_review_tags_on_tag_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "apartment_id"
    t.integer "user_id"
    t.text "review_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["apartment_id"], name: "index_reviews_on_apartment_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "admin_tables", "users"
  add_foreign_key "review_amenities", "amenities"
  add_foreign_key "review_amenities", "reviews"
  add_foreign_key "review_metrics", "metrics"
  add_foreign_key "review_metrics", "reviews"
  add_foreign_key "review_tags", "reviews"
  add_foreign_key "review_tags", "tags"
  add_foreign_key "reviews", "apartments"
  add_foreign_key "reviews", "users"
end
