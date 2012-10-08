# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :group_id, :user_id
  
  #
  # Associations
  #
  belongs_to :user
  belongs_to :group
end
