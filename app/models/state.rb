# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class State < ActiveRecord::Base
  attr_accessible :name
  
  #
  # Associations
  #
  has_many :provinces
  
  #
  # Scopes
  #
  default_scope order('name asc')
end
