class NewsController < ApplicationController
  def index
    @news = News.by_status(:published).includes(:news_actors)
  end
end
