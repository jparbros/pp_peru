class NewsActor < ActiveRecord::Base
  attr_accessible :name, :avatar
  has_and_belongs_to_many :papers
end
