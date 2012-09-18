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
