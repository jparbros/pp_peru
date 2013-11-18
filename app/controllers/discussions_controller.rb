class DiscussionsController < ApplicationController
  def index
    @discussions = Discussion.text_search(params[:query]).
                  actives.by_permissions(current_user).by_topics(params[:topic_id])
    render cms_layout: 'diseno-principal'
  end
  
  def show
    @discussion = Discussion.find params[:id]
    #authorize! :read, @discussion
    render cms_layout: 'diseno-principal'
  end
end
