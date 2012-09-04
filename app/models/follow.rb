class Follow < ActiveRecord::Base
  acts_as_follow_store
  before_save :setup_activity
  before_destroy :delete_activity
  
  include PublicActivity::Model
  tracked
  
  private
  def setup_activity
    self.activity_owner = self.follower
    self.activity_params = {name: self.followable.user_name}
  end
  
  def delete_activity
    self.activities.where(owner_id: self.follower, owner_type: 'User').first.try(:destroy)
  end
end
