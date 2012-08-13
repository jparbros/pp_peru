# == Schema Information
#
# Table name: papers
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  author_id  :integer
#  type       :string(255)
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Paper < ActiveRecord::Base
  #
  # Accessors
  #
  attr_accessible :author_id, :content, :status, :title, :type, :actor_tokens
  attr_reader :actor_tokens

  #
  # Associations
  #
  belongs_to :author, class_name: 'User'
  has_many :annotations, as: :annotable
  has_and_belongs_to_many :news_actors
  
  #
  # Delegates
  #
  delegate :name, :to => :author, :prefix => true
  
  
  #
  #   Scopes
  #
  scope :by_status, lambda{|status| where('status = ?', status)}

  #
  # Instance methods
  #
  def actor_tokens=(tokens)
    self.news_actor_ids = NewsActor.ids_from_tokens(tokens)
  end

end
