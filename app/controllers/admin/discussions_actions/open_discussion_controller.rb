class Admin::DiscussionsActions::OpenDiscussionController < Admin::BaseController

  def create
    @discussion = Discussion.find params[:discussion_id]
    @discussion.open_discussion! if @discussion.can_open_discussion?
    redirect_to admin_discussions_path, notice: 'EL Debate se ha abierto.'
  end
end