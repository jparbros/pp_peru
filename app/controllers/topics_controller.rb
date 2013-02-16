class TopicsController < ApplicationController
  def index
    @tree = Topic.tree
    @controller_t = params[:controller_t]
  end
end
