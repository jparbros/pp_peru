class DiscussionsController < ApplicationController
  def index
    @discussions = Discussion.actives.by_permissions(current_user)
  end
  
  def show
    @discussion = Discussion.find params[:id]
  end
end
