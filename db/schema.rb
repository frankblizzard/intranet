# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120723091751) do

  create_table "assignments", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "project_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bug_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bugs", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bug_status_id", :default => 1
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "full_name"
    t.string   "client_nr"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
    t.text     "rg_adress"
    t.string   "billing_code"
    t.integer  "payment_within", :default => 14
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hours", :force => true do |t|
    t.date     "date"
    t.float    "amount"
    t.boolean  "extra",            :default => false
    t.boolean  "holiday",          :default => false
    t.boolean  "ill",              :default => false
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "task_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "work_category_id"
    t.boolean  "public_holiday"
    t.boolean  "comp_time"
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "project_id"
    t.float    "rating"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jc_comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "content"
    t.integer  "x1"
    t.integer  "y1"
    t.integer  "x2"
    t.integer  "y2"
    t.integer  "w"
    t.integer  "h"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_category_id"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.text     "bio"
    t.string   "avatar"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.string   "job_description"
    t.boolean  "freelancer",       :default => false
    t.date     "in_company_since"
    t.float    "time_mon",         :default => 8.0
    t.float    "time_tue",         :default => 8.0
    t.float    "time_wed",         :default => 8.0
    t.float    "time_thu",         :default => 8.0
    t.float    "time_fri",         :default => 8.0
    t.boolean  "is_client"
    t.integer  "client_id"
    t.boolean  "locked",           :default => false
    t.boolean  "management",       :default => false
  end

  create_table "project_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nr"
    t.integer  "client_id"
    t.boolean  "hidden",                         :default => false
    t.integer  "project_status_id", :limit => 1, :default => 1,            :null => false
    t.boolean  "web",                            :default => false,        :null => false
    t.boolean  "active",                         :default => true,         :null => false
    t.boolean  "locked"
    t.date     "deadline",                       :default => '2012-03-28'
    t.boolean  "feedback_enabled",               :default => false
    t.integer  "project_leader_id"
    t.boolean  "internal",                       :default => false
  end

  create_table "review_assignments", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "review_images", :force => true do |t|
    t.integer  "review_id"
    t.string   "name"
    t.integer  "project_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.string   "name"
    t.datetime "date_opened"
    t.datetime "date_closed"
    t.integer  "project_id"
    t.boolean  "closed"
    t.integer  "project_leader_id"
    t.string   "email_when_changed"
    t.string   "client_emails"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_id"
    t.date     "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "plan_hours"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",                                 :default => false
    t.boolean  "project_manager",                       :default => false
    t.string   "avatar"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.text     "bio"
    t.date     "bday"
    t.string   "phone"
    t.boolean  "freelancer",                            :default => false
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "work_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
