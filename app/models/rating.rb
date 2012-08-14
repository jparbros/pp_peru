=begin
 == Schema Information
Table name: ratings
t.integer  "rateable_id"
t.string   "rateable_type"
t.integer  "author_id"
t.float    "rate"
t.datetime "created_at",    :null => false
t.datetime "updated_at",    :null => false
=end
class Rating < ActiveRecord::Base
  #
  # Relations
  #
  belongs_to :rateable, :polymorphic => true
  belongs_to :author, class_name: 'User'
end
