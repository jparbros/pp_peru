class Admin::NewsActions::ArchiveController < Admin::BaseController

  def create
    @news = News.find params[:news_id]
    @news.archive! if @news.can_archive?
    redirect_to news_index_url, notice: 'La noticia se ha archivado.'
  end

end
