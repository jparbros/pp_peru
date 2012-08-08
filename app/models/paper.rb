# == Schema Information
#
# Table name: papers
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  author_id  :integer
#  type       :string(255)
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
