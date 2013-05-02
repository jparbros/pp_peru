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

ActiveRecord::Schema.define(:version => 20130501235337) do

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

  create_table "activity_actions", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "activity_object_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "follow",             :default => false
    t.boolean  "author",             :default => false
    t.boolean  "user_author",        :default => false
    t.boolean  "owner",              :default => false
  end

  add_index "activity_actions", ["activity_object_id"], :name => "index_activity_actions_on_activity_object_id"
  add_index "activity_actions", ["actor_id"], :name => "index_activity_actions_on_actor_id"

  create_table "activity_object_activities", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "activity_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "object_type"
  end

  add_index "activity_object_activities", ["activity_id"], :name => "index_activity_object_activities_on_activity_id"
  add_index "activity_object_activities", ["activity_object_id"], :name => "index_activity_object_activities_on_activity_object_id"

  create_table "activity_object_audiences", :force => true do |t|
    t.integer  "activity_object_id"
    t.integer  "relation_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "activity_object_properties", :force => true do |t|
    t.integer "activity_object_id"
    t.integer "property_id"
    t.string  "type"
  end

  add_index "activity_object_properties", ["activity_object_id"], :name => "index_activity_object_properties_on_activity_object_id"
  add_index "activity_object_properties", ["property_id"], :name => "index_activity_object_properties_on_property_id"

  create_table "activity_objects", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "object_type",    :limit => 45
    t.integer  "like_count",                   :default => 0
    t.string   "title",                        :default => ""
    t.text     "description"
    t.integer  "follower_count",               :default => 0
    t.integer  "visit_count",                  :default => 0
    t.integer  "comment_count",                :default => 0
  end

  create_table "activity_verbs", :force => true do |t|
    t.string   "name",       :limit => 45
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actors", :force => true do |t|
    t.string   "name"
    t.string   "email",              :default => "",   :null => false
    t.string   "slug"
    t.string   "subject_type"
    t.boolean  "notify_by_email",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_object_id"
  end

  add_index "actors", ["activity_object_id"], :name => "index_actors_on_activity_object_id"
  add_index "actors", ["email"], :name => "index_actors_on_email"
  add_index "actors", ["slug"], :name => "index_actors_on_slug", :unique => true

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

  create_table "audiences", :force => true do |t|
    t.integer "relation_id"
    t.integer "activity_id"
  end

  add_index "audiences", ["activity_id"], :name => "index_audiences_on_activity_id"
  add_index "audiences", ["relation_id"], :name => "index_audiences_on_relation_id"

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "avatars", :force => true do |t|
    t.integer  "actor_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "active",            :default => true
  end

  add_index "avatars", ["actor_id"], :name => "index_avatars_on_actor_id"

  create_table "comments", :force => true do |t|
    t.integer  "activity_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["activity_object_id"], :name => "index_comments_on_activity_object_id"

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

  create_table "contacts", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inverse_id"
    t.integer  "ties_count",  :default => 0
  end

  add_index "contacts", ["inverse_id"], :name => "index_contacts_on_inverse_id"
  add_index "contacts", ["receiver_id"], :name => "index_contacts_on_receiver_id"
  add_index "contacts", ["sender_id"], :name => "index_contacts_on_sender_id"

  create_table "conversations", :force => true do |t|
    t.string   "subject",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "documents", :force => true do |t|
    t.string   "type"
    t.integer  "activity_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.string   "file_file_size"
    t.boolean  "file_processing"
  end

  add_index "documents", ["activity_object_id"], :name => "index_documents_on_activity_object_id"

  create_table "events", :force => true do |t|
    t.integer  "activity_object_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "all_day"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "room_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "frequency",          :default => 0
    t.integer  "interval"
    t.integer  "days",               :default => 0
    t.integer  "interval_flag",      :default => 0
  end

  add_index "events", ["room_id"], :name => "index_events_on_room_id"

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

  create_table "links", :force => true do |t|
    t.integer  "activity_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "callback_url"
    t.string   "image"
    t.integer  "width",              :default => 470
    t.integer  "height",             :default => 353
  end

  add_index "links", ["activity_object_id"], :name => "index_links_on_activity_object_id"

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

  create_table "notifications", :force => true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              :default => ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                :default => false
    t.datetime "updated_at",                              :null => false
    t.datetime "created_at",                              :null => false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
  end

  add_index "notifications", ["conversation_id"], :name => "index_notifications_on_conversation_id"

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

  create_table "posts", :force => true do |t|
    t.integer  "activity_object_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["activity_object_id"], :name => "index_posts_on_activity_object_id"

  create_table "profiles", :force => true do |t|
    t.integer  "actor_id"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organization", :limit => 45
    t.string   "phone",        :limit => 45
    t.string   "mobile",       :limit => 45
    t.string   "fax",          :limit => 45
    t.string   "address"
    t.string   "city"
    t.string   "zipcode",      :limit => 45
    t.string   "province",     :limit => 45
    t.string   "country",      :limit => 45
    t.integer  "prefix_key"
    t.string   "description"
    t.string   "experience"
    t.string   "website"
    t.string   "skype",        :limit => 45
    t.string   "im",           :limit => 45
  end

  add_index "profiles", ["actor_id"], :name => "index_profiles_on_actor_id"

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

  create_table "receipts", :force => true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                                  :null => false
    t.boolean  "read",                          :default => false
    t.boolean  "trashed",                       :default => false
    t.boolean  "deleted",                       :default => false
    t.string   "mailbox_type",    :limit => 25
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "receipts", ["notification_id"], :name => "index_receipts_on_notification_id"

  create_table "relation_permissions", :force => true do |t|
    t.integer  "relation_id"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relation_permissions", ["permission_id"], :name => "index_relation_permissions_on_permission_id"
  add_index "relation_permissions", ["relation_id"], :name => "index_relation_permissions_on_relation_id"

  create_table "relations", :force => true do |t|
    t.integer  "actor_id"
    t.string   "type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sender_type"
    t.string   "receiver_type"
    t.string   "ancestry"
  end

  add_index "relations", ["actor_id"], :name => "index_relations_on_actor_id"
  add_index "relations", ["ancestry"], :name => "index_relations_on_ancestry"

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

  create_table "rooms", :force => true do |t|
    t.integer  "actor_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rooms", ["actor_id"], :name => "index_rooms_on_actor_id"

  create_table "settings", :force => true do |t|
    t.string   "var",                      :null => false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", :limit => 30
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], :name => "index_settings_on_thing_type_and_thing_id_and_var", :unique => true

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
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "type_id"
    t.string   "type_description"
    t.boolean  "political_party_objective"
  end

  add_index "strategic_objectives", ["ancestry"], :name => "index_strategic_objectives_on_ancestry"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "ties", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "relation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ties", ["contact_id"], :name => "index_ties_on_contact_id"
  add_index "ties", ["relation_id"], :name => "index_ties_on_relation_id"

  create_table "topics", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "ancestry"
  end

  add_index "topics", ["ancestry"], :name => "index_topics_on_ancestry"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role_c"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "political_party_id"
    t.string   "name",                   :default => ""
    t.string   "avatar"
    t.integer  "state_id"
    t.integer  "province_id"
    t.integer  "role_id",                :default => 1
    t.integer  "district_id"
    t.string   "charge"
    t.string   "dni"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
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
