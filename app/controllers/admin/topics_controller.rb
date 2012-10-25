class Admin::TopicsController < Admin::BaseController
  def index
    @topics = Topic.scoped
    respond_to do |format|
      format.html
      format.json{ render json: (params[:q] ?  @topics.tokens(params[:q]) : @topics.tree)}
    end
  end

  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      redirect_to :admin_topics, notice: 'Tema Creado'
    else
      render action: :index
    end
  end
end
