class NewsActorsController < ApplicationController
  respond_to :json, :html
  
  def rates
    @news_actor = find_news_actor(params[:id])
    @news_actor.ratings.create(rate: params[:rate], author: current_subject)
    respond_with @news_actor
  end
  
  private
  
  def find_news_actor(id_news_actor)
    NewsActor.find(id_news_actor)
  end
end
