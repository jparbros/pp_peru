class NewsController < ApplicationController
  def index
    @news = News.by_status(:published).includes(:news_actors)
  end
  
  def show
    @news = find_news(params[:id])
    @annotable = @news
    @annotation = @annotable.annotations.new
  end
  
  private
  
  def find_news(id_news)
    News.find(id_news)
  end
end
