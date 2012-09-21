class UserPermission < ActiveRecord::Base
  attr_accessible :action, :subject_class
  has_and_belongs_to_many :users
end
