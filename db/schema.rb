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

ActiveRecord::Schema.define(version: 2018_09_17_141556) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "username", default: "", null: false
    t.string "address", default: "", null: false
    t.string "mobile", default: "", null: false
    t.string "post_code", default: "", null: false
    t.boolean "is_default", default: false
    t.boolean "disable", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "province_id"
    t.integer "city_id"
    t.integer "district_id"
    t.index ["disable"], name: "index_addresses_on_disable"
    t.index ["mobile"], name: "index_addresses_on_mobile"
    t.index ["post_code"], name: "index_addresses_on_post_code"
    t.index ["province_id", "city_id", "district_id"], name: "index_addresses_on_province_id_and_city_id_and_district_id"
    t.index ["user_id", "disable"], name: "index_addresses_on_user_id_and_disable"
    t.index ["user_id", "is_default"], name: "index_addresses_on_user_id_and_is_default"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "carousels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tag", null: false
    t.string "images"
    t.boolean "visible", default: false
    t.index ["tag"], name: "index_carousels_on_tag", unique: true
    t.index ["visible"], name: "index_carousels_on_visible"
  end

  create_table "china_regions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", null: false
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], name: "index_china_regions_on_code", unique: true
    t.index ["name"], name: "index_china_regions_on_name"
  end

  create_table "customize_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "intro", default: ""
    t.string "keywords", default: ""
    t.text "description"
    t.string "images"
    t.boolean "visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intro"], name: "index_customize_products_on_intro"
    t.index ["title"], name: "index_customize_products_on_title", unique: true
    t.index ["visible"], name: "index_customize_products_on_visible"
  end

  create_table "dynamics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "web_url", null: false
    t.text "description"
    t.boolean "visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_dynamics_on_title", unique: true
    t.index ["visible"], name: "index_dynamics_on_visible"
  end

  create_table "partners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "web_url", default: ""
    t.boolean "vip", default: false
    t.boolean "visible", default: false
    t.index ["title"], name: "index_partners_on_title", unique: true
    t.index ["vip"], name: "index_partners_on_vip"
    t.index ["visible"], name: "index_partners_on_visible"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.boolean "visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_posts_on_title", unique: true
    t.index ["visible"], name: "index_posts_on_visible"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "intro", default: ""
    t.string "keywords", default: ""
    t.text "description"
    t.string "images"
    t.boolean "visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intro"], name: "index_products_on_intro"
    t.index ["title"], name: "index_products_on_title", unique: true
    t.index ["visible"], name: "index_products_on_visible"
  end

  create_table "redactor_assets", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assetable_type", "assetable_id"], name: "idx_redactor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", default: "", null: false
    t.string "mobile", default: "", null: false
    t.string "authentication_token", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mobile"], name: "index_users_on_mobile", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
