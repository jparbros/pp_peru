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
  attr_accessible :author_id, :content, :status, :title, :type, :actor_tokens, :topic_tokens
  attr_reader :actor_tokens, :topic_tokens

  #
  # Associations
  #
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  has_many :annotations, as: :annotable
  has_many :ratings, as: :rateable
  has_and_belongs_to_many :news_actors
  has_and_belongs_to_many :topics
  
  #
  # Delegates
  #
  delegate :name, :to => :author, :prefix => true
  
  
  #
  #   Scopes
  #
  scope :by_status, lambda{|status| where('status = ?', status)}
  scope :by_author, lambda{|author| where(author_id: author)} 

  #
  # Instance methods
  #
  def actor_tokens=(tokens)
    self.news_actor_ids = NewsActor.ids_from_tokens(tokens)
  end
  
  def topic_tokens=(tokens)
    self.topic_ids = Topic.ids_from_tokens(tokens)
  end

end
