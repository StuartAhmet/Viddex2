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

ActiveRecord::Schema[7.0].define(version: 2023_07_26_134045) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "audios", force: :cascade do |t|
    t.string "title"
    t.string "public_uid"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "length"
    t.index ["user_id"], name: "index_audios_on_user_id"
  end

  create_table "backgrounds", force: :cascade do |t|
    t.string "title"
    t.string "public_uid"
    t.integer "x_axis", default: 350
    t.integer "y_axis", default: 250
    t.integer "width", default: 350
    t.integer "angle", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.jsonb "distort", default: {}
    t.integer "distort_nw_x"
    t.integer "distort_nw_y"
    t.integer "distort_ne_x"
    t.integer "distort_ne_y"
    t.integer "distort_sw_x"
    t.integer "distort_sw_y"
    t.integer "distort_se_x"
    t.integer "distort_se_y"
    t.integer "text_box_height", default: 200
    t.boolean "text_distortion", default: false
    t.index ["user_id"], name: "index_backgrounds_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "public_uid"
    t.string "industry"
    t.string "subscription_type"
    t.string "domain"
    t.string "color_theme1"
    t.string "color_theme2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "notes"
    t.string "country"
    t.string "job_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read"
    t.string "reason"
  end

  create_table "project_audios", force: :cascade do |t|
    t.integer "project_id"
    t.integer "audio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "projects_id"
    t.bigint "audios_id"
    t.index ["audios_id"], name: "index_project_audios_on_audios_id"
    t.index ["project_id", "audio_id"], name: "index_project_audios_on_project_id_and_audio_id", unique: true
    t.index ["projects_id"], name: "index_project_audios_on_projects_id"
  end

  create_table "project_backgrounds", force: :cascade do |t|
    t.integer "project_id"
    t.integer "background_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "projects_id"
    t.bigint "backgrounds_id"
    t.index ["backgrounds_id"], name: "index_project_backgrounds_on_backgrounds_id"
    t.index ["project_id", "background_id"], name: "index_project_backgrounds_on_project_id_and_background_id", unique: true
    t.index ["projects_id"], name: "index_project_backgrounds_on_projects_id"
  end

  create_table "project_videos", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "video_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.bigint "projects_id"
    t.bigint "videos_id"
    t.index ["project_id", "video_id"], name: "index_project_videos_on_project_id_and_video_id", unique: true
    t.index ["projects_id"], name: "index_project_videos_on_projects_id"
    t.index ["videos_id"], name: "index_project_videos_on_videos_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "prospect_first"
    t.string "prospect_last"
    t.string "prospect_company"
    t.string "prospect_email"
    t.string "public_uid"
    t.integer "opacity", default: 70
    t.string "font", default: "permanent marker"
    t.integer "font_size", default: 38
    t.bigint "background_id"
    t.bigint "video_id"
    t.bigint "user_id"
    t.boolean "include_meeting_link", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "message_body"
    t.string "title"
    t.bigint "audio_id"
    t.bigint "template_id"
    t.index ["audio_id"], name: "index_projects_on_audio_id"
    t.index ["background_id"], name: "index_projects_on_background_id"
    t.index ["template_id"], name: "index_projects_on_template_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
    t.index ["video_id"], name: "index_projects_on_video_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.integer "video_count"
    t.boolean "audio_required"
    t.string "video_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "public_uid"
    t.text "synopsis"
    t.string "video_title1"
    t.string "video_title2"
    t.string "video_title3"
    t.string "video_title4"
    t.text "video_script1"
    t.text "video_script2"
    t.text "video_script3"
    t.text "video_script4"
    t.string "tutorial_link"
    t.index ["user_id"], name: "index_templates_on_user_id"
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
    t.string "last_name"
    t.string "company_name"
    t.string "industry"
    t.string "public_uid"
    t.string "provider"
    t.string "uid"
    t.string "full_name"
    t.string "avatar_url"
    t.boolean "admin", default: false
    t.string "meeting_link"
    t.boolean "company_admin", default: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["public_uid"], name: "index_users_on_public_uid", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "public_uid"
    t.string "industry"
    t.bigint "user_id"
    t.boolean "bgrem_require", default: false
    t.boolean "bgrem_complete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "distort_nw_x"
    t.integer "distort_nw_y"
    t.integer "distort_ne_x"
    t.integer "distort_ne_y"
    t.integer "distort_sw_x"
    t.integer "distort_sw_y"
    t.integer "distort_se_x"
    t.integer "distort_se_y"
    t.integer "text_width", default: 350
    t.integer "x_axis", default: 350
    t.integer "y_axis", default: 250
    t.integer "angle"
    t.integer "text_box_height", default: 200
    t.boolean "text_distortion", default: false
    t.string "thumbnail"
    t.text "text_body"
    t.string "category"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "audios", "users"
  add_foreign_key "backgrounds", "users"
  add_foreign_key "project_audios", "audios", column: "audios_id"
  add_foreign_key "project_audios", "projects", column: "projects_id"
  add_foreign_key "project_backgrounds", "backgrounds", column: "backgrounds_id"
  add_foreign_key "project_backgrounds", "projects", column: "projects_id"
  add_foreign_key "project_videos", "projects", column: "projects_id"
  add_foreign_key "project_videos", "videos", column: "videos_id"
  add_foreign_key "projects", "audios"
  add_foreign_key "projects", "backgrounds"
  add_foreign_key "projects", "templates"
  add_foreign_key "projects", "users"
  add_foreign_key "projects", "videos"
  add_foreign_key "templates", "users"
  add_foreign_key "users", "companies"
  add_foreign_key "videos", "users"
end
