# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  state_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Province < ActiveRecord::Base
  attr_accessible :name, :state_id
  
  #
  # Associations
  #
  has_many :districts
  belongs_to :state

end
