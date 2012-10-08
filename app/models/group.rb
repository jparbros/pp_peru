# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :name, :owner_id, :user_tokens
  attr_reader :user_tokens
  
  #
  # Associations
  #
  has_many :memberships
  has_many :users, through: :memberships
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :permissions
  has_many :papers, through: :permissions
  
  
  def user_tokens=(ids)
    self.user_ids = ids.split(",")
  end
  
end
