# == Schema Information
#
# Table name: user_permissions
#
#  id            :integer          not null, primary key
#  action        :string(255)
#  subject_class :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class UserPermission < ActiveRecord::Base
  attr_accessible :action, :subject_class
  has_and_belongs_to_many :users
end
