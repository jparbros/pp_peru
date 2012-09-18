class Admin::EntriesActions::PublishController < Admin::BaseController

  def create
    @entry = Entry.find params[:entry_id]
    @entry.publish! if @entry.can_publish?
    redirect_to admin_entries_path, notice: 'La Entrada se ha publicado.'
  end

end
