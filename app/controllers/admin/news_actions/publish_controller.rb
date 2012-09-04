class Admin::NewsActions::PublishController < Admin::BaseController

  def create
    @news = News.find params[:news_id]
    @news.publish! if @news.can_publish?
    redirect_to admin_news_index_path, notice: 'La noticia se ha publicado.'
  end

end
