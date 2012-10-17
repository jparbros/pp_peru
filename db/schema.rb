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

ActiveRecord::Schema.define(:version => 20121014185623) do

  create_table "activities", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "annotations", :force => true do |t|
    t.string   "title"
    t.text     "comment"
    t.integer  "annotable_id"
    t.string   "annotable_type"
    t.integer  "author_id"
    t.string   "status"
    t.string   "ancestry"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "annotations", ["ancestry"], :name => "index_annotations_on_ancestry"

  create_table "attendees", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.date     "birthday"
    t.integer  "state_id"
    t.string   "instruction"
    t.string   "dni"
    t.integer  "province_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "attendees_strategic_objectives", :id => false, :force => true do |t|
    t.integer "strategic_objective_id", :null => false
    t.integer "attendee_id",            :null => false
  end

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "configurations", :force => true do |t|
    t.string   "site_name"
    t.string   "color1"
    t.string   "color2"
    t.string   "color3"
    t.string   "color4"
    t.string   "color5"
    t.string   "comments_limit"
    t.string   "footer_image"
    t.string   "header_image"
    t.string   "background_image"
    t.boolean  "public_registration"
    t.text     "home_main_content"
    t.text     "registration_mail_content"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "follows", :force => true do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], :name => "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], :name => "fk_follows"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "likes", :force => true do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], :name => "fk_likeables"
  add_index "likes", ["liker_id", "liker_type"], :name => "fk_likes"

  create_table "memberships", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mentions", :force => true do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], :name => "fk_mentionables"
  add_index "mentions", ["mentioner_id", "mentioner_type"], :name => "fk_mentions"

  create_table "messages", :force => true do |t|
    t.text     "message"
    t.integer  "author_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["author_id"], :name => "index_messages_on_author_id"

  create_table "news_actors", :force => true do |t|
    t.string   "name",               :default => "", :null => false
    t.string   "avatar",             :default => ""
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "political_party_id"
  end

  create_table "news_actors_papers", :id => false, :force => true do |t|
    t.integer "news_actor_id", :null => false
    t.integer "paper_id",      :null => false
  end

  create_table "papers", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "author_id"
    t.string   "type"
    t.string   "status"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "political_party_id"
    t.string   "visibility"
    t.datetime "published_at"
    t.datetime "published_end_at"
  end

  create_table "papers_strategic_objectives", :id => false, :force => true do |t|
    t.integer "strategic_objective_id", :null => false
    t.integer "paper_id",               :null => false
  end

  create_table "papers_topics", :id => false, :force => true do |t|
    t.integer "topic_id", :null => false
    t.integer "paper_id", :null => false
  end

  create_table "permissions", :force => true do |t|
    t.integer  "group_id"
    t.integer  "paper_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "political_parties", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ratings", :force => true do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "author_id"
    t.float    "rate"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "paper_id"
  end

  create_table "reports", :force => true do |t|
    t.integer  "author_id"
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "role_permissions", :force => true do |t|
    t.string   "action"
    t.string   "subject_class"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "role_permissions_roles", :id => false, :force => true do |t|
    t.integer "role_permission_id", :null => false
    t.integer "role_id",            :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "strategic_objectives", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "accomplished"
    t.date     "date_objective"
    t.string   "ancestry"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "type_id"
    t.string   "type_description"
  end

  add_index "strategic_objectives", ["ancestry"], :name => "index_strategic_objectives_on_ancestry"

  create_table "topics", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",            :null => false
    t.string   "encrypted_password",     :default => "",            :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "political_party_id"
    t.string   "name",                   :default => ""
    t.string   "avatar"
    t.integer  "state_id"
    t.integer  "province_id"
    t.string   "role_c",                 :default => "participant"
    t.integer  "role_id",                :default => 1
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "author_id"
    t.integer  "tendency"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
