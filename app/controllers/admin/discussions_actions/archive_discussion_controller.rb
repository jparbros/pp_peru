class Admin::DiscussionsActions::ArchiveDiscussionController < Admin::BaseController

  def create
    @discussion = Discussion.find params[:discussion_id]
    @discussion.archive! if @discussion.can_archive?
    redirect_to admin_discussions_path, notice: 'EL Debate se ha archivado.'
  end
end