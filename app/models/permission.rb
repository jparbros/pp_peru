class Permission < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :group_id, :paper_id
  
  #
  # Associations
  #
  belongs_to :group
  belongs_to :paper
end
