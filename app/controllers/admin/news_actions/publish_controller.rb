class Admin::NewsActions::PublishController < Admin::BaseController

  def create
    @news = News.find params[:news_id]
    @news.publish! if @news.can_publish?
    redirect_to news_index_url, notice: 'La noticia se ha publicado.'
  end

end
