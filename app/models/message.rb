class Message < ActiveRecord::Base
  belongs_to :author
  attr_accessible :message
end
