class NewsController < ApplicationController
  respond_to :json, :html

  def index
    @news = News.by_status(:published).includes(:news_actors)
  end

  def show
    @news = find_news(params[:id])
    @rate = @news.ratings.average(:rate)
  end

  def rates
    @news = find_news(params[:id])
    if current_subject.have_rateable? @news
      @news.ratings.create(rate: params[:rate], author: current_subject)
      message = "Calificacion ha sido guardada"
    else
      message = "Ya calificado esta Noticia"
    end
    respond_with({notice: message}, location: root_path)
  end

  private

  def find_news(id_news)
    News.find(id_news)
  end
end
