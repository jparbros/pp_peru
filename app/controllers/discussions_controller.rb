class DiscussionsController < ApplicationController
  def index
    @discussions = Discussion.text_search(params[:query]).
                  actives.by_permissions(current_user).by_topics(params[:topic_id]).recents
  end
  
  def show
    @discussion = Discussion.find params[:id]
    #authorize! :read, @discussion
  end
end
