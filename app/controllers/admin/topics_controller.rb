class Admin::TopicsController < ApplicationController
  def index
    @topics = Topic.order(:name)
    respond_to do |format|
      format.json{ render json: @topics.tokens(params[:q])}
    end
  end
end
