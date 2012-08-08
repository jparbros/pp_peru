class Paper < ActiveRecord::Base
  #
  # Accessors
  #
  attr_accessible :author_id, :content, :status, :title, :type

  #
  # Associations
  #
  belongs_to :author, class_name: 'User'
  has_many :annotations, as: :annotable
end
