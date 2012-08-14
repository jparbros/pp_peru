class NewsController < ApplicationController
  respond_to :json, :html
  def index
    @news = News.by_status(:published).includes(:news_actors)
  end
  
  def show
    @news = find_news(params[:id])
    @annotable = @news
    @annotation = @annotable.annotations.new
    @annotations = @annotable.annotations.includes(author:  :actor)
    @rate = @news.ratings.average(:rate)
  end
  
  def rates
    @news = find_news(params[:id])
    @news.ratings.create(rate: params[:rate], author: current_subject)
    respond_with @news
  end
  
  private
  
  def find_news(id_news)
    News.find(id_news)
  end
end
