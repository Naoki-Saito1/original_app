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

ActiveRecord::Schema.define(version: 2021_12_02_070752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id"
    t.index ["sender_id", "recipient_id"], name: "index_conversations_on_sender_id_and_recipient_id", unique: true
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "portfolio_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["portfolio_id"], name: "index_favorites_on_portfolio_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "frameworks", force: :cascade do |t|
    t.string "framework_name"
    t.bigint "portfolio_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["portfolio_id"], name: "index_frameworks_on_portfolio_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "twitter"
    t.string "github"
    t.string "qiita"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_links_on_profile_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "message_body"
    t.bigint "conversation_id", null: false
    t.bigint "user_id", null: false
    t.boolean "message_read", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "portfolio_title", null: false
    t.text "portfolio_body", null: false
    t.text "portfolio_image"
    t.integer "portfolio_language", default: 0, null: false
    t.string "portfolio_github"
    t.text "portfolio_url", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.text "image"
    t.string "name", null: false
    t.integer "gender", default: 0
    t.date "birth_date"
    t.integer "address", default: 0
    t.integer "status", default: 0
    t.string "detail", null: false
    t.text "body", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "address_check", default: false
    t.boolean "gender_check", default: false
    t.boolean "birth_date_check", default: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "portfolios"
  add_foreign_key "favorites", "users"
  add_foreign_key "frameworks", "portfolios"
  add_foreign_key "links", "profiles"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "portfolios", "users"
  add_foreign_key "profiles", "users"
end
