class NewsController < ApplicationController
  respond_to :json, :html
  
  def index
    @news = ::News.text_search(params[:query]).published.by_permissions(current_user).by_topics(params[:topic_id]).recents
    render cms_layout: 'diseno-principal'
  end

  def show
    @news = find_news(params[:id])
    @rate = @news.ratings.average(:rate) || 0
    authorize! :read, @news
  end

  def rates
    @news = find_news(params[:id])
    if current_user.have_rateable? @news
      @news.ratings.create(rate: params[:rate], author: current_user)
      message = "Calificacion ha sido guardada"
    else
      message = "Ya calificado esta Noticia"
    end
    respond_with({notice: message}, location: noticia_url(@news))
  end

  private

  def find_news(id_news)
    ::News.find(id_news)
  end
end
