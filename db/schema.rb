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

ActiveRecord::Schema.define(version: 2022_05_21_025956) do

  create_table "study_plans", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "plan_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_study_plans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username", limit: 30
    t.string "password_digest"
    t.string "auth_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "vocabularies", force: :cascade do |t|
    t.string "base_word"
    t.string "translation"
    t.string "synonym"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vocabulary_maps", force: :cascade do |t|
    t.integer "vocabulary_id", null: false
    t.integer "vocabulary_set_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vocabulary_id"], name: "index_vocabulary_maps_on_vocabulary_id"
    t.index ["vocabulary_set_id"], name: "index_vocabulary_maps_on_vocabulary_set_id"
  end

  create_table "vocabulary_sets", force: :cascade do |t|
    t.integer "study_plan_id", null: false
    t.string "set_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["study_plan_id"], name: "index_vocabulary_sets_on_study_plan_id"
  end

  add_foreign_key "study_plans", "users"
  add_foreign_key "vocabulary_maps", "vocabularies"
  add_foreign_key "vocabulary_maps", "vocabulary_sets"
  add_foreign_key "vocabulary_sets", "study_plans"
end
