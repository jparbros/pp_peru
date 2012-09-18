class Group < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :name, :owner_id
  
  #
  # Associations
  #
  has_many :memberships
  has_many :users, through: :memberships
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :permissions
  has_many :papers, through: :permissions
  
end
