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