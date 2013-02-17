class District < ActiveRecord::Base
  attr_accessible :name, :province_id
  belongs_to :province
end
