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
  attr_accessible :author_id, :content, :status, :title, :type, :actor_tokens, :visibility, :topic_tokens, :published_end_at
  attr_reader :actor_tokens, :topic_tokens

  #
  # Associations
  #
  has_many :annotations, as: :annotable
  has_many :votes, as: :votable
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  has_many :ratings, as: :rateable
  has_and_belongs_to_many :news_actors
  has_and_belongs_to_many :topics
  
  #
  # Extend
  #
  include PublicActivity::Model
  tracked
  #
  # Constants
  #
  VISIBILITY = {public: :publico, members: :miembros, admin: :administradores}

  #
  # Delegates
  #
  delegate :name, :to => :author, :prefix => true


  #
  #   Scopes
  #
  scope :by_status, lambda{|status| where('status IN (?)', status)}
  scope :by_author, lambda{|author| where(author_id: author)}

  #
  # State machine
  #
  state_machine :status, :initial => :draft do
    state :draft
    state :published
    state :archived

    before_transition any => :published, :do => [:publish_timestamp, :setup_activity]

    event :publish do
      transition [:draft, :archived] => :published
    end

    event :archive do
      transition published: :archived
    end
  end

  #
  # Callback
  #
  after_initialize :parse_content
  #
  # Class methods
  #

  class << self
    def visibility
      VISIBILITY.collect {|visible| [visible.last.to_s.humanize, visible.first]}
    end

    def by_permissions(user)
      where(visibility: user ? user.permission : :public)
    end
  end

  #
  # Instance methods
  #
  def actor_tokens=(tokens)
    self.news_actor_ids = NewsActor.ids_from_tokens(tokens)
  end

  def topic_tokens=(tokens)
    self.topic_ids = Topic.ids_from_tokens(tokens)
  end

  def publish_timestamp
    self.published_at = Time.now
  end

  def published_day
    published_at.strftime '%d'
  end

  def published_month
    published_at.strftime '%b'
  end
  
  def parse_content
    @content_parsed = Nokogiri::HTML(content)
  end

  def first_paragraph
    @content_parsed.css('p').first.to_s
  end
  
  def setup_activity
    self.activity_owner = :author
    self.activity_params = {title: self.title, id: self.id}
  end

end
