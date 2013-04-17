class Admin::NewsController < Admin::BaseController
  before_filter :find_news, only: [:edit, :show, :destroy, :update]
  before_filter :ensure_author!, only: [:edit, :show, :detroy, :update]
 
  def index
    @news = ::News.by_permissions(current_user).recents
    respond_to do |format|
      format.html{authorize! :read, News}
      format.json {render json: @news.news_by_title(params[:q])}
    end
  end

  def new
    @news = ::News.new
    authorize! :read, News
  end

  def create
    @news = News.new(params[:news])
    @news.author = current_user
    if @news.save
      redirect_to admin_news_index_path, notice: 'Creado Correctamente'
    else
      render :new
    end
  end

  def edit
    authorize! :update, News
  end

  def destroy
    authorize! :destroy, News
    @news.destroy
    redirect_to admin_news_index_path, notice: 'Eliminado Correctamente'
  end

  def update
    if @news.update_attributes(params[:news])
      redirect_to admin_news_index_path, notice: 'Actualizado Correctamente'
    else
      render :edit
    end
  end

  private

  def find_news
    @news = News.find params[:id]
  end
  
  def ensure_author!
    redirect_to admin_news_index_path, notice: 'Recurso no Autorizado' if @news.author_id != current_user.id
  end
end
