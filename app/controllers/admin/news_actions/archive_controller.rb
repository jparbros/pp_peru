class Admin::NewsActions::ArchiveController < Admin::BaseController

  def create
    @news = ::News.find params[:news_id]
    @news.archive! if @news.can_archive?
    redirect_to admin_news_index_path, notice: 'La noticia se ha archivado.'
  end

end
