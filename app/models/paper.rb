# == Schema Information
#
# Table name: papers
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  content            :text
#  author_id          :integer
#  type               :string(255)
#  status             :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  political_party_id :integer
#  visibility         :string(255)
#  published_at       :datetime
#  published_end_at   :datetime
#

class Paper < ActiveRecord::Base
  #
  # Accessors
  #
  attr_accessible :author_id, :content, :status, :title, :type, :actor_tokens, :visibility, :topic_tokens, :published_end_at, :group_tokens
  attr_reader :actor_tokens, :topic_tokens, :group_tokens
  
  validates :content, :title, presence: true
  #
  # Associations
  #
  has_many :annotations, as: :annotable
  has_many :votes, as: :votable
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  has_many :ratings, as: :rateable
  has_and_belongs_to_many :news_actors
  has_and_belongs_to_many :topics
  has_and_belongs_to_many :strategic_objectives
  has_many :permissions
  has_many :groups, through: :permissions
  
  #
  # Delegation
  #
  delegate :count, to: :annotations, prefix: true
  
  
  #
  # Extend
  #
  include PublicActivity::Model
  tracked
  
  #
  # Constants
  #
  VISIBILITY = {public: :publico, members: :miembros, admin: :administradores, group: :grupo}

  #
  # Delegates
  #
  delegate :name, :to => :author, :prefix => true


  #
  #   Scopes
  #
  scope :by_status, lambda{|status| where('status IN (?)', status)}
  scope :by_author, lambda{|author| where(author_id: author)}
  scope :recents, order('papers.created_at DESC')

  #
  # State machine
  #
  state_machine :status, :initial => :draft do
    state :draft
    state :published
    state :archived

    before_transition any => :published, :do => [:publish_timestamp, :setup_activity]
    after_transition any => :published, :do => :send_notification

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
  
  def self.text_search(query)
    if query.present?
      sql = "to_tsvector('spanish', title) @@ to_tsquery('spanish', :q) or 
        to_tsvector('spanish', content) @@ to_tsquery('spanish', :q)"
      where(sql, q: format(query))
    else
      scoped
    end
  end
  
  def self.by_topics(topic_id)
    if topic_id.present?  
      joins(:topics).where('papers_topics.topic_id = ?', topic_id)
    else
      scoped
    end
  end

  class << self
    def visibility
      VISIBILITY.collect {|visible| [visible.last.to_s.humanize, visible.first]}
    end

    def by_permissions(user)
      includes(:groups).where("visibility IN (?) OR groups.id IN (?)", (user.try(:permission) || :public), user.try(:group_ids) || nil)
    end
  end

  #
  # Instance methods
  #
  def actor_tokens=(tokens)
    self.news_actor_ids = NewsActor.ids_from_tokens(tokens)
  end

  def topic_tokens=(ids)
    self.topic_ids = ids.split(',')
  end

  def publish_timestamp
    self.published_at = Time.now
  end

  def published_date
    I18n.l(published_at.to_date, format: :short).titleize
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
  
  
  def positive_votes
     votes.where(tendency: 1).size
  end

  def negative_votes
   votes.where(tendency: -1).size
  end
   
  def group_tokens=(ids)
   self.group_ids = ids.split(',')
  end

  def send_notification
    User.send_notifications(self)
  end
  
  private
  def self.format(query)
    query.mb_chars.normalize(:kd).
      gsub(/[^\x00-\x7F]/n,'').split(' ').join('|')
  end

end
