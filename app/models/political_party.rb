class PoliticalParty < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :name
  has_many :users
=======
  attr_accessible :description, :name

  #
  # Asociations
  #
  has_many :users
  has_many :news
  has_many :proposals
  has_many :entries

>>>>>>> 581f8e3ea201f6973e4d25b777fe0a7bf287eb5c
end
