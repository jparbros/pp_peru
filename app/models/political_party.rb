# == Schema Information
#
# Table name: political_parties
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PoliticalParty < ActiveRecord::Base

  attr_accessible :name
  has_many :users

  attr_accessible :description, :name

  #
  # Asociations
  #
  has_many :users
  has_many :news
  has_many :proposals
  has_many :entries

end
