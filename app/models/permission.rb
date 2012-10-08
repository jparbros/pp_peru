# == Schema Information
#
# Table name: permissions
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  paper_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
