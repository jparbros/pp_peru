class UsersActivities::FollowersController < ApplicationController
  before_filter :find_user
  
  def create
    current_user.follow!(@user)
    redirect_to usuario_path(@user)
  end
  
  def destroy 
    current_user.unfollow!(@user)
    redirect_to usuario_path(@user)
  end
  
  private 
  def find_user
    @user = User.find params[:usuario_id]
  end
end