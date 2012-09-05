class Admin::DiscussionsActions::CloseDiscussionController < Admin::BaseController

  def create
    @discussion = Discussion.find params[:discussion_id]
    @discussion.close_discussion! if @discussion.can_close_discussion?
    redirect_to admin_discussions_path, notice: 'EL Debate se ha Cerrado.'
  end
end