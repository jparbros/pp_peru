class Admin::NewsActorsController < Admin::BaseController
  before_filter :find_news_actor, only: [:edit, :show, :detroy, :update]
  authorize_resource
  
  def index
    @news_actors = NewsActor.order(:name)
    respond_to do |format|
      format.html
      format.json { render json: @news_actors.tokens(params[:q]) }
    end
  end
  
  def new
    @news_actor = NewsActor.new
  end
  
  def edit
  end
  
  def show
  end
  
  def  create
    @news_actor = NewsActor.new(params[:news_actor])
    if @news_actor.save
      redirect_to :admin_news_actors, notice: 'Actor Creado'
    else
      render :new
    end
  end
  
  def update
    if @news_actor.update_attributes(params[:news_actor])
      redirect_to :admin_news_actors, notice: 'Actualizado Correctamente'
    else
      render :edit
    end
  end
  
  def destroy
    @news_actor.destroy
    redirect_to :admin_news_actors, notice: 'Actor Eliminado'
  end
  
  def find_news_actor
    @news_actor = NewsActor.find params[:id]
  end
end
