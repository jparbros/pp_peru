# == Schema Information
#
# Table name: news_actors
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  avatar     :string(255)      default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NewsActor < ActiveRecord::Base
  attr_accessible :name, :avatar
  
  mount_uploader :avatar, AvatarUploader
  #
  # Relations
  #
  has_and_belongs_to_many :papers
  has_many :ratings, as: :rateable
  
  #
  # Class methods
  #
  
  def self.tokens(query)
    actors = where("name like ?", "%#{query}%")
    if actors.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      actors
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end
end
