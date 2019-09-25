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

ActiveRecord::Schema.define(version: 2019_09_25_121534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "authors"
    t.text "description"
    t.string "published_date"
    t.string "image_link"
    t.string "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "group_id"
    t.string "cover"
    t.integer "likes_count", default: 0
    t.text "owner_comment"
    t.integer "owner_grade"
    t.string "genres"
    t.index ["group_id"], name: "index_books_on_group_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_comments_on_book_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "platforms"
    t.string "released"
    t.string "devs"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "background_image"
    t.integer "likes_count", default: 0
    t.text "owner_comment"
    t.integer "owner_grade"
    t.string "genres"
    t.index ["group_id"], name: "index_games_on_group_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: true
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "likable_type"
    t.bigint "likable_id"
    t.index ["likable_type", "likable_id"], name: "index_likes_on_likable_type_and_likable_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "overview"
    t.string "release_date"
    t.string "original_title"
    t.string "poster_path"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "poster"
    t.integer "likes_count", default: 0
    t.text "owner_comment"
    t.string "genres"
    t.string "imdb_url"
    t.integer "tmdb_id"
    t.integer "owner_grade"
    t.index ["group_id"], name: "index_movies_on_group_id"
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "image"
    t.string "genres"
    t.string "title"
    t.text "description"
    t.string "publisher"
    t.bigint "group_id"
    t.bigint "user_id"
    t.integer "owner_grade"
    t.text "owner_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes_count", default: 0
    t.string "image_path"
    t.index ["group_id"], name: "index_podcasts_on_group_id"
    t.index ["user_id"], name: "index_podcasts_on_user_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "title"
    t.text "overview"
    t.string "release_date"
    t.string "poster_path"
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "poster"
    t.integer "likes_count", default: 0
    t.text "owner_comment"
    t.integer "owner_grade"
    t.string "genres"
    t.index ["group_id"], name: "index_series_on_group_id"
    t.index ["user_id"], name: "index_series_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "avatar"
    t.string "uid", default: "", null: false
    t.json "tokens"
    t.string "provider", default: "email", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "books", "groups"
  add_foreign_key "books", "users"
  add_foreign_key "comments", "books"
  add_foreign_key "comments", "users"
  add_foreign_key "games", "groups"
  add_foreign_key "games", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "users"
  add_foreign_key "movies", "groups"
  add_foreign_key "movies", "users"
  add_foreign_key "podcasts", "groups"
  add_foreign_key "podcasts", "users"
  add_foreign_key "series", "groups"
  add_foreign_key "series", "users"
end
