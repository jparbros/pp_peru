class Role < ActiveRecord::Base
  attr_accessible :name, :role_permission_ids
  
  #
  # Constans
  #
  ROLES = ['participant', 'moderator', 'member', 'admin', 'super_admin']

  #
  # Relations
  #
  has_many :users
  has_and_belongs_to_many :role_permissions
  #
  #   Scopes
  #
  scope :by_roles, lambda{|roles| where('name IN (?)', roles)}
end
