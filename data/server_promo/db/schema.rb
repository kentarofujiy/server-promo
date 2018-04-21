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

ActiveRecord::Schema.define(version: 2018_04_12_053307) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artifacts", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.integer "projeto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["projeto_id"], name: "index_artifacts_on_projeto_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pois_id"
    t.index ["pois_id"], name: "index_businesses_on_pois_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "landmarks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "details"
    t.text "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.text "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "album_id"
    t.index ["album_id"], name: "index_photos_on_album_id"
  end

  create_table "poi_categories", force: :cascade do |t|
    t.integer "poi_id"
    t.integer "category_id"
  end

  create_table "poi_groups", force: :cascade do |t|
    t.integer "poi_id"
    t.integer "group_id"
  end

  create_table "poi_landmarks", force: :cascade do |t|
    t.integer "poi_id"
    t.integer "landmark_id"
  end

  create_table "pois", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "name"
    t.string "string"
    t.string "address"
    t.text "notes"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "business_id"
    t.string "acessibilidade"
    t.index ["business_id"], name: "index_pois_on_business_id"
  end

  create_table "projeto_artifacts", force: :cascade do |t|
    t.integer "projeto_id"
    t.integer "artifact_id"
  end

  create_table "projeto_categories", force: :cascade do |t|
    t.integer "projeto_id"
    t.integer "category_id"
  end

  create_table "projetos", force: :cascade do |t|
    t.string "nome"
    t.string "especialidade"
    t.string "telefone"
    t.string "endereco"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
  end

  create_table "tour_pois", force: :cascade do |t|
    t.integer "poi_id"
    t.integer "tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "duration"
    t.string "intensity"
    t.string "distance"
    t.string "audience"
    t.text "details"
    t.integer "user_id"
  end

  create_table "user_tours", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tour_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

end
