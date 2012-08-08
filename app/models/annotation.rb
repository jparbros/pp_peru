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
