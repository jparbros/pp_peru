class Attendee < ActiveRecord::Base
  attr_accessible :birthday, :dni, :gender, :instruction, :name, :province_id, :state_id
  validates :name, presence: true
  has_and_belongs_to_many :strategic_objectives
  
  GENDER = [{id: 1, name: 'Masculino'}, {id: 2, name: 'Femenino'}]
  
end
