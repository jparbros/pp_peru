class Topic < ActiveRecord::Base
  attr_accessible :name

  #
  # Relations
  #

  has_and_belongs_to_many :papers

  #
  # Class Methods
  #

  def self.tokens(query)
    topics = where("name like ?", "%#{query}%")
    if topics.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      topics
    end
  end
  
  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end
end