class Admin::EntriesActions::ArchiveController < Admin::BaseController

  def create
    @entry = Entry.find params[:entry_id]
    @entry.archive! if @entry.can_archive?
    redirect_to admin_entries_path, notice: 'La propuesta se ha archivado.'
  end

end
