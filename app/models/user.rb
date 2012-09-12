# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  role                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                  :string(255)      default('')
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body


  #
  # Constans
  #
  ROLES = ['super_admin', 'admin', 'member', 'participant']

  #
  # Relations
  #
  has_many :ratings, foreign_key: :author_id
  has_many :reports, foreign_key: :author_id
  has_many :votes, foreign_key: :author_id
  

  #
  #Extend
  #

  include PublicActivity::Model
  tracked
  acts_as_follower
  acts_as_followable
  acts_as_liker
  
  
  #
  # Instance methods
  #

  ROLES.each do |role|
    define_method "#{role}?" do
      self.role.eql? role
    end
  end

  def have_rateable?(rateable)
    kind = (rateable.kind_of? News)? 'Paper' : 'NewsActor'
    self.ratings.by_rateable(kind, rateable).empty?
  end

  def have_rate_actor_paper?(actor, paper)
    self.ratings.by_rateable('NewsActor', actor).by_paper(paper).empty?
  end

  def user_rates
    self.ratings.includes(:rateable).group_by(&:rateable_type)
  end
  
  def user_name
    name.empty? ? email : name
  end

  def activities_by_owner
    PublicActivity::Activity.where("owner_id IN (?) AND owner_type = 'User'", [id] + follows(User).map(&:followable_id)).
      includes(:owner).order(:created_at).limit(20)
  end
  
  def permission
    case role
    when 'super_admin', 'admin'
      [:admin, :members, :public]
    when 'member'
      [:members, :public]
    when 'participant', nil
      :public
    end
  end
  
end
