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

ActiveRecord::Schema.define(version: 20161213220132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.string "title"
    t.text   "content"
  end

  create_table "mubees", force: :cascade do |t|
    t.integer  "crew_id"
    t.integer  "producer_id"
    t.integer  "contract_id"
    t.string   "location"
    t.float    "lat"
    t.float    "lng"
    t.text     "brief"
    t.integer  "budget"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.date     "deadline"
    t.boolean  "accepted"
    t.index ["contract_id"], name: "index_mubees_on_contract_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "body"
    t.float    "rating"
    t.integer  "sender"
    t.integer  "recipient"
    t.integer  "mubee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mubee_id"], name: "index_reviews_on_mubee_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills_users", id: false, force: :cascade do |t|
    t.integer "skill_id", null: false
    t.integer "user_id",  null: false
    t.index ["skill_id", "user_id"], name: "index_skills_users_on_skill_id_and_user_id", using: :btree
    t.index ["user_id", "skill_id"], name: "index_skills_users_on_user_id_and_skill_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.string   "image"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "website"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "full_name"
    t.boolean  "crew"
  end

  add_foreign_key "mubees", "contracts"
  add_foreign_key "reviews", "mubees"
end
