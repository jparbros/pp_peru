# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ActiveRecord::Base
  attr_accessible :name, :parent_id

  #
  # Relations
  #

  has_and_belongs_to_many :papers
  #
  # Extends
  #
  has_ancestry

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
  
  def self.by_type_paper(type)
    joins(:papers).where("papers.type = ?", type.singularize.capitalize)
  end
  
  def self.tree(tree = [])
    arrange.map do |parent, childrens|
      tree << {id: parent.id, label: parent.name, 
        children: childrens.map{|children, a| {id: children.id, label: children.name}}}
    end
    tree
  end
end
