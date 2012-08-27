# == Schema Information
#
# Table name: ratings
#
#  id            :integer          not null, primary key
#  rateable_id   :integer
#  rateable_type :string(255)
#  author_id     :integer
#  rate          :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  paper_id      :integer
#

=begin
 == Schema Information
Table name: ratings
t.integer  "rateable_id"
t.string   "rateable_type"
t.integer  "author_id"
t.float    "rate"
t.integer  "paper_id"
t.datetime "created_at",    :null => false
t.datetime "updated_at",    :null => false
=end
class Rating < ActiveRecord::Base
  #
  # Relations
  #
  belongs_to :rateable, polymorphic: true
  belongs_to :author, class_name: 'User'
  
  #
  # Scopes
  #
  
  scope :by_rateable, lambda{|type, id| where('rateable_type = ? AND rateable_id = ?', type, id)}
  scope :by_paper, lambda{|paper| where(paper_id: paper)}
end
