class NewsActor < ActiveRecord::Base
  attr_accessible :name, :avatar
  
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
