# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_27_023847) do

  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bests", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "praise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "post_id", null: false
    t.index ["post_id"], name: "index_bests_on_post_id"
    t.index ["praise_id"], name: "index_bests_on_praise_id"
    t.index ["user_id"], name: "index_bests_on_user_id"
  end

  create_table "charges", charset: "utf8", force: :cascade do |t|
    t.integer "amount", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_charges_on_user_id"
  end

  create_table "likes", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "follow_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follow_id"], name: "index_likes_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_likes_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "pays", charset: "utf8", force: :cascade do |t|
    t.integer "amount", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pays_on_user_id"
  end

  create_table "point_breakdowns", charset: "utf8", force: :cascade do |t|
    t.integer "amount", null: false
    t.bigint "user_point_id", null: false
    t.bigint "point_history_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["point_history_id"], name: "index_point_breakdowns_on_point_history_id"
    t.index ["user_point_id"], name: "index_point_breakdowns_on_user_point_id"
  end

  create_table "point_histories", charset: "utf8", force: :cascade do |t|
    t.integer "amount", null: false
    t.integer "pointable_id"
    t.string "pointable_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pointable_id", "pointable_type"], name: "index_point_histories_on_pointable_id_and_pointable_type"
    t.index ["user_id"], name: "index_point_histories_on_user_id"
  end

  create_table "posts", charset: "utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "text", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "praises", charset: "utf8", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_praises_on_post_id"
    t.index ["user_id"], name: "index_praises_on_user_id"
  end

  create_table "user_points", charset: "utf8", force: :cascade do |t|
    t.integer "amount", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_points_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.text "self_introduction"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bests", "posts"
  add_foreign_key "bests", "praises"
  add_foreign_key "bests", "users"
  add_foreign_key "charges", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "likes", "users", column: "follow_id"
  add_foreign_key "pays", "users"
  add_foreign_key "point_breakdowns", "point_histories"
  add_foreign_key "point_breakdowns", "user_points"
  add_foreign_key "point_histories", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "praises", "posts"
  add_foreign_key "praises", "users"
  add_foreign_key "user_points", "users"
end
