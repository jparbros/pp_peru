# == Schema Information
#
# Table name: strategic_objectives
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  description    :text
#  accomplished   :boolean
#  date_objective :date
#  ancestry       :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class StrategicObjective < ActiveRecord::Base
  attr_accessible :ancestry, :description, :title, :date_objective, :parent_id, :accomplished, :paper_tokens
  attr_reader :paper_tokens
  TYPES = [{depth: 0, name: 'general'}, {depth:  1, name: 'strategic'}, {depth: 2, name: 'specific'}]
  #
  # Validations
  #
  validates :title, presence: true
  
  #
  # Associations
  #
  has_many :annotations, as: :annotable
  has_and_belongs_to_many :papers
  #
  # Extends
  #
  has_ancestry
  
  #
  # Instance methods
  #
  def paper_tokens=(ids)
    self.paper_ids = ids.split(',')
  end
  
  TYPES.each do |type|
    define_method "#{type[:name]}?" do
      self.depth.eql? type[:depth]
    end
  end
end