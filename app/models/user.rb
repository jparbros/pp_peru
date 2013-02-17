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
#  political_party_id     :integer
#  name                   :string(255)      default("")
#  avatar                 :string(255)
#  state_id               :integer
#  province_id            :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_id, :name, 
    :avatar, :state_id, :province_id, :district_id




  #
  # Relations
  #
  has_many :ratings, foreign_key: :author_id
  has_many :reports, foreign_key: :author_id
  has_many :votes, foreign_key: :author_id
  has_many :authentications
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :owned_groups, class_name: 'Group', foreign_key: :owner_id
  belongs_to :role
  belongs_to :state
  belongs_to :province
  belongs_to :district
  
  #
  # Delegates
  #
  delegate :name, to: :role, prefix: true
  delegate :role_permissions, to: :role, prefix: false
  
  #
  #Extend
  #

  include PublicActivity::Model
  tracked
  acts_as_follower
  acts_as_followable
  acts_as_liker
  
  #
  # Uploader
  #
  mount_uploader :avatar, AvatarUploader

  #
  # Class Methods
  #
  def self.roles_by_user(user)
    case user.role_name
    when 'super_admin' then Role.scoped
    when 'admin' then Role.by_roles(%w(admin member participant))
    when 'moderator' then Role.by_roles(%w(member participant))
    end
  end
  #
  # Instance methods
  #

  if Role.table_exists?
    Role.all.each do |role|
      define_method "#{role.name}?" do
        self.role_id.eql? role.id
      end
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
    case role_name
    when 'super_admin', 'admin'
      [:admin, :members, :public]
    when 'member'
      [:members, :public]
    when 'participant', nil
      [:public]
    end
  end
  
  def admin_access?
    permission.include? :admin
  end

  def apply_omniauth(omniauth)
     case omniauth['provider']
     when 'facebook'
       self.apply_facebook(omniauth)
     when 'twitter'
       self.apply_twitter(omniauth)
     end
     authentications.build(hash_from_omniauth(omniauth))
     save!
   end

   def facebook
     @fb_user ||= FbGraph::User.me(self.authentications.find_by_provider('facebook').token)
   end

   def twitter
     unless @twitter_user
       provider = self.authentications.find_by_provider('twitter')
       @twitter_user = Twitter::Client.new(:oauth_token => provider.token, :oauth_token_secret => provider.secret) rescue nil
     end
     @twitter_user
   end
   
   def profile_photo
     unless avatar.blank?
       avatar.url(:small)
     else
       '/assets/avatar.png'
     end
  end
  
  def group_search
    {id: id, name: (name.blank? ? email : name)}
  end

   protected

   def apply_facebook(omniauth)
     if (extra = omniauth['extra']['user_hash'] rescue false)
       self.email = (extra['email'] rescue '')
     end
   end

   def apply_twitter(omniauth)
     puts omniauth.inspect
     if (extra = omniauth['extra']['user_hash'] rescue false)
     end
   end

   def hash_from_omniauth(omniauth)
     {
       :provider => omniauth['provider'],
       :uid => omniauth['uid'],
       :token => (omniauth['credentials']['token'] rescue nil),
       :secret => (omniauth['credentials']['secret'] rescue nil)
     }
   end
end
