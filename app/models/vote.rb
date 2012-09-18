# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  author_id    :integer
#  tendency     :integer
#  votable_id   :integer
#  votable_type :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ActiveRecord::Base
  attr_accessible :author_id, :author, :tendency
  #
  # Associations
  #
  belongs_to :votable, polymorphic: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  
end
