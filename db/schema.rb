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

ActiveRecord::Schema[8.0].define(version: 2024_12_21_005312) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "actor", primary_key: "actor_id", id: :serial, force: :cascade do |t|
    t.json "json"
    t.uuid "user_account_id", null: false
    t.string "name", limit: 255
    t.string "skin", limit: 255
    t.string "profession", limit: 255
    t.integer "level"
    t.integer "experience"
    t.integer "age"
    t.integer "staminia"
    t.integer "mana"
    t.integer "health"
    t.string "health_modifiers", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "alembic_version", primary_key: "version_num", id: { type: :string, limit: 32 }, force: :cascade do |t|
  end

  create_table "anon_user_account", primary_key: "user_account_id", id: :uuid, default: nil, force: :cascade do |t|
    t.string "username", limit: 30
    t.string "password", limit: 512
    t.string "email", limit: 50
    t.boolean "admin", null: false
    t.boolean "confirmed", null: false
    t.datetime "confirmed_on", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil

    t.unique_constraint ["username"], name: "anon_user_account_username_key"
  end

  create_table "captains_log", primary_key: "captains_log_id", id: :serial, force: :cascade do |t|
    t.text "text"
    t.string "captains_log_type", limit: 30
    t.string "status", limit: 255
    t.uuid "user_account_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "comment", primary_key: "comment_id", id: :serial, force: :cascade do |t|
    t.integer "post_id", null: false
    t.text "text"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "comment_tree", primary_key: "comment_tree_id", id: :serial, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "nearest_ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "depth", null: false
  end

  create_table "event", primary_key: "event_id", id: :serial, force: :cascade do |t|
    t.string "label", limit: 50
    t.string "device", limit: 30
    t.string "app", limit: 255
    t.string "who", limit: 255
    t.string "description", limit: 255
    t.json "json"
    t.datetime "created_on", precision: nil
  end

  create_table "gold", primary_key: "gold_id", id: :serial, force: :cascade do |t|
    t.text "text"
    t.string "gold_type", limit: 30
    t.uuid "user_account_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "completed", null: false
    t.datetime "completed_on", precision: nil
  end

  create_table "item", primary_key: "item_id", id: :serial, force: :cascade do |t|
    t.json "json"
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.string "material", limit: 100
    t.string "color", limit: 10
    t.string "skin", limit: 100
    t.integer "damage"
    t.integer "age"
    t.integer "protection"
    t.string "item_type", limit: 100
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "keyword", primary_key: "keyword_id", id: :serial, force: :cascade do |t|
    t.string "keyword", limit: 255, null: false
  end

  create_table "lighthouse", primary_key: "lighthouse_id", id: :serial, force: :cascade do |t|
    t.string "device", limit: 30
    t.string "url", limit: 255
    t.string "label", limit: 100
    t.string "company", limit: 255
    t.string "time_to_meaningful_paint", limit: 50
    t.string "time_to_contentful_paint", limit: 50
    t.string "time_to_interactive", limit: 50
    t.integer "performance_score"
    t.integer "accessibility_score"
    t.integer "seo_score"
    t.datetime "created_at", precision: nil
  end

  create_table "listicle", primary_key: "listicle_id", id: :serial, force: :cascade do |t|
    t.uuid "user_account_id"
    t.uuid "anon_user_account_id"
    t.text "url"
    t.text "description"
    t.string "title", limit: 255
    t.string "category", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "post", primary_key: "post_id", id: :serial, force: :cascade do |t|
    t.uuid "user_account_id", null: false
    t.text "title"
    t.text "description"
    t.text "content"
    t.string "blogpost_type", limit: 255
    t.string "status", limit: 255
    t.string "markup_type", limit: 255
    t.text "slug"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "post_heart", primary_key: "post_heart_id", id: :serial, force: :cascade do |t|
    t.uuid "user_account_id", null: false
    t.text "title"
    t.text "content"
    t.text "url"
    t.string "publisher", limit: 255
    t.integer "bonus_points"
    t.integer "read_percent"
    t.text "research"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "post_hide", primary_key: "post_heart_id", id: :serial, force: :cascade do |t|
    t.uuid "user_account_id", null: false
    t.text "title"
    t.text "content"
    t.text "url"
    t.string "publisher", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "post_keywords", primary_key: ["post_id", "keyword_id"], force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "keyword_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.boolean "promotion_applied"
    t.integer "stock_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quiz", primary_key: "quiz_id", id: :serial, force: :cascade do |t|
    t.text "section_title"
    t.uuid "quiz_question_collection_id", null: false
    t.uuid "quiz_question_id", null: false
    t.uuid "user_account_id", null: false
    t.integer "version"
    t.integer "order"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "quiz_answer", primary_key: "answer_id", id: :uuid, default: nil, force: :cascade do |t|
    t.text "answer"
    t.uuid "user_account_id"
    t.uuid "anon_user_account_id"
    t.uuid "quiz_question_id"
    t.uuid "quiz_answer_collection_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "quiz_answer_collection", primary_key: "quiz_answer_collection_id", id: :uuid, default: nil, force: :cascade do |t|
    t.uuid "user_account_id"
    t.uuid "anon_user_account_id"
    t.uuid "quiz_question_collection_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "quiz_question", primary_key: "quiz_question_id", id: :uuid, default: nil, force: :cascade do |t|
    t.json "question_media"
    t.text "question"
    t.string "question_type", limit: 30
    t.text "answer"
    t.json "question_options"
    t.json "question_references"
    t.uuid "quiz_question_collection_id"
    t.uuid "user_account_id"
    t.uuid "anon_user_account_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "quiz_question_collection", primary_key: "quiz_question_collection_id", id: :uuid, default: nil, force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.uuid "user_account_id"
    t.uuid "anon_user_account_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "strava", primary_key: "strava_id", id: :serial, force: :cascade do |t|
    t.string "athlete_id", limit: 255
    t.string "token", limit: 512
    t.string "refresh_token", limit: 512
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.uuid "user_account_id", null: false

    t.unique_constraint ["athlete_id"], name: "strava_athlete_id_key"
  end

  create_table "subscription", primary_key: "subscription_id", id: :serial, force: :cascade do |t|
    t.uuid "user_account_id", null: false
    t.string "subscription_type", limit: 255
    t.string "status", limit: 255
    t.string "app", limit: 255
    t.datetime "started_at", precision: nil
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "tile", primary_key: "tile_id", id: :serial, force: :cascade do |t|
    t.json "json"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.uuid "user_account_id", null: false
    t.string "label", limit: 100
    t.string "description", limit: 255
    t.string "material", limit: 100
    t.integer "movement_cost"
    t.integer "elevation"
    t.string "color", limit: 100
    t.text "skin"
    t.integer "damage"
    t.integer "age"
    t.integer "item_id", null: false
  end

  create_table "transaction", primary_key: "transaction_id", id: :serial, force: :cascade do |t|
    t.string "title", limit: 30
    t.string "type", limit: 30
    t.integer "cost"
    t.json "transaction_json"
    t.uuid "user_account_id", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "user_account", primary_key: "user_account_id", id: :uuid, default: nil, force: :cascade do |t|
    t.string "username", limit: 30
    t.string "password", limit: 512
    t.string "email", limit: 50
    t.boolean "admin", null: false
    t.boolean "confirmed", null: false
    t.datetime "confirmed_on", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil

    t.unique_constraint ["username"], name: "user_account_username_key"
  end

  create_table "user_google_account", primary_key: "user_google_accounts_id", id: :uuid, default: nil, force: :cascade do |t|
    t.string "primary_personal_email", limit: 50
    t.json "google_accounts"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "world", primary_key: "world_id", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 500
    t.json "json"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.uuid "user_account_id", null: false
    t.string "status", limit: 500
  end

  add_foreign_key "actor", "user_account", primary_key: "user_account_id", name: "actor_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "comment", "post", primary_key: "post_id", name: "comment_post_id_fkey"
  add_foreign_key "comment_tree", "comment", column: "ancestor_id", primary_key: "comment_id", name: "comment_tree_ancestor_id_fkey"
  add_foreign_key "comment_tree", "comment", column: "descendant_id", primary_key: "comment_id", name: "comment_tree_descendant_id_fkey"
  add_foreign_key "comment_tree", "comment", column: "nearest_ancestor_id", primary_key: "comment_id", name: "comment_tree_nearest_ancestor_id_fkey"
  add_foreign_key "gold", "user_account", primary_key: "user_account_id", name: "gold_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "listicle", "anon_user_account", primary_key: "user_account_id", name: "listicle_anon_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "listicle", "user_account", primary_key: "user_account_id", name: "listicle_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "post", "user_account", primary_key: "user_account_id", name: "post_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "post_heart", "user_account", primary_key: "user_account_id", name: "post_heart_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "post_hide", "user_account", primary_key: "user_account_id", name: "post_hide_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "post_keywords", "keyword", primary_key: "keyword_id", name: "post_keywords_keyword_id_fkey"
  add_foreign_key "post_keywords", "post", primary_key: "post_id", name: "post_keywords_post_id_fkey"
  add_foreign_key "quiz", "quiz_question", primary_key: "quiz_question_id", name: "quiz_quiz_question_id_fkey", on_delete: :cascade
  add_foreign_key "quiz", "quiz_question_collection", primary_key: "quiz_question_collection_id", name: "quiz_quiz_question_collection_id_fkey", on_delete: :cascade
  add_foreign_key "quiz", "user_account", primary_key: "user_account_id", name: "quiz_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_answer", "anon_user_account", primary_key: "user_account_id", name: "quiz_answer_anon_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_answer", "quiz_answer_collection", primary_key: "quiz_answer_collection_id", name: "quiz_answer_quiz_answer_collection_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_answer", "quiz_question", primary_key: "quiz_question_id", name: "quiz_answer_quiz_question_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_answer", "user_account", primary_key: "user_account_id", name: "quiz_answer_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_answer_collection", "anon_user_account", primary_key: "user_account_id", name: "quiz_answer_collection_anon_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_answer_collection", "quiz_question_collection", primary_key: "quiz_question_collection_id", name: "quiz_answer_collection_quiz_question_collection_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_answer_collection", "user_account", primary_key: "user_account_id", name: "quiz_answer_collection_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_question", "anon_user_account", primary_key: "user_account_id", name: "quiz_question_anon_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_question", "quiz_question_collection", primary_key: "quiz_question_collection_id", name: "quiz_question_quiz_question_collection_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_question", "user_account", primary_key: "user_account_id", name: "quiz_question_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_question_collection", "anon_user_account", primary_key: "user_account_id", name: "quiz_question_collection_anon_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "quiz_question_collection", "user_account", primary_key: "user_account_id", name: "quiz_question_collection_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "strava", "user_account", primary_key: "user_account_id", name: "strava_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "subscription", "user_account", primary_key: "user_account_id", name: "subscription_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "tile", "item", primary_key: "item_id", name: "tile_item_id_fkey", on_delete: :cascade
  add_foreign_key "tile", "user_account", primary_key: "user_account_id", name: "tile_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "transaction", "user_account", primary_key: "user_account_id", name: "transaction_user_account_id_fkey", on_delete: :cascade
  add_foreign_key "world", "user_account", primary_key: "user_account_id", name: "world_user_account_id_fkey", on_delete: :cascade
end
