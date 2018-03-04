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

ActiveRecord::Schema.define(version: 20180304040517) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "street", null: false
    t.integer "number", null: false
    t.string "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "neighborhood_id"
    t.bigint "city_id"
    t.bigint "state_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["neighborhood_id"], name: "index_addresses_on_neighborhood_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "state_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "neighborhoods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_neighborhoods_on_city_id"
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "initials", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_seeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "registration"
    t.string "organization"
    t.string "role"
    t.string "cpf"
    t.string "simple_address"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "registration"
    t.string "email", default: "", null: false
    t.string "name", null: false
    t.string "surname"
    t.string "nickname"
    t.string "cpf", null: false
    t.string "landline"
    t.string "cellphone", default: "", null: false
    t.string "whatsapp"
    t.string "simple_address"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.bigint "role_id"
    t.bigint "address_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["cpf"], name: "index_users_on_cpf"
    t.index ["email"], name: "index_users_on_email"
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["registration"], name: "index_users_on_registration"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "neighborhoods"
  add_foreign_key "addresses", "states"
  add_foreign_key "cities", "states"
  add_foreign_key "neighborhoods", "cities"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "organizations"
  add_foreign_key "users", "roles"
end
