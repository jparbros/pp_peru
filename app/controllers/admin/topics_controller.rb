class Admin::TopicsController < Admin::BaseController
  def index
    @topics = Topic.order(:name)
    respond_to do |format|
      format.html
      format.json{ render json: (params[:q] ?  @topics.tokens(params[:q]) : @topics.tree)}
    end
  end
end
