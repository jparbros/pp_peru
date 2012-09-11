class Vote < ActiveRecord::Base
  attr_accessible :author_id, :author, :tendency
  #
  # Associations
  #
  belongs_to :votable, polymorphic: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  
end
