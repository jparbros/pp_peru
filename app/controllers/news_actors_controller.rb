class NewsActorsController < ApplicationController
  respond_to :json, :html

  def rates
    news_id = request.referer.split('/').last
    @news_actor = find_news_actor(params[:id])
    if current_user.have_rate_actor_paper?(@news_actor, news_id)
      @news_actor.ratings.create(rate: params[:rate], author: current_user, paper_id: news_id)
      message = "Calificacion ha sido guardada"
    else
      message = "Ya calificaste este actor en esta Noticia"
    end
    respond_with({notice: message}, location: noticia_url(@news_actor))
  end

  private

  def find_news_actor(id_news_actor)
    NewsActor.find(id_news_actor)
  end
end
