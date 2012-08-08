# == Schema Information
#
# Table name: annotations
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  comment        :text
#  annotable_id   :integer
#  annotable_type :string(255)
#  author_id      :integer
#  status         :string(255)
#  reports        :integer
#  ancestry       :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Annotation < ActiveRecord::Base

  #
  # Associations
  #
  belongs_to :annotable, :polymorphic => true
  belongs_to :author, class_name: 'User'

  #
  # Accessors
  #
  attr_accessible :ancestry, :annotable_id, :annotable_type, :author_id, :comment, :reports, :status, :title

  #
  # Extends
  #
  has_ancestry
end
