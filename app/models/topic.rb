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
  scope :only_children, where("ancestry is not null")
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
    where("name like ?", "%#{query}%").only_children
  end
  
  def self.topics_by_index(query)
    query ? tokens(query) : tree
  end
  
  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end
  
  def self.by_type_paper(type)
    joins(:papers).where("papers.type = ?", type.singularize.capitalize)
  end
  
  def self.tree(tree = [])
    arrange(order: :name).map do |parent, childrens|
      tree << {id: parent.id, label: parent.name, 
        children: childrens.map{|children, a| {id: children.id, label: children.name}}}
    end
    tree
  end
end
