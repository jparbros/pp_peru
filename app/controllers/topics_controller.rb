class TopicsController < ApplicationController
  def index
    @topics = Topic.scoped
    respond_to do |format|
      format.html
      format.json{ render json: @topics.topics_by_index(params[:q])}
    end
  end
end
