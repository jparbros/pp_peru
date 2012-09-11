class Follow < ActiveRecord::Base
  acts_as_follow_store
  before_create :setup_activity
  before_destroy :delete_activity
  
  include PublicActivity::Model
  tracked
  
  private
  def setup_activity
    self.activity_owner = self.follower
    self.activity_params = {name: self.followable.user_name, id: self.followable.id}
  end
  
  def delete_activity
    self.activities.where(owner_id: self.follower, owner_type: 'User').first.try(:destroy)
  end
end
