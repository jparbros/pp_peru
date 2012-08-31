class Admin::NewsController < Admin::BaseController
  before_filter :find_news, only: [:edit, :show, :detroy, :update]
  before_filter :ensure_author!, only: [:edit, :show, :detroy, :update]

  def index
    @news = ::News.by_author(current_user)
  end

  def new
    @news = ::News.new
  end

  def create
    @news = ::News.new(params[:news])
    @news.author = current_user
    if @news.save
      redirect_to admin_news_index_path, notice: 'Creado Correctamente'
    else
      render :new
    end
  end

  def edit
  end

  def destroy
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
    @news = ::News.find params[:id]
  end
  
  def ensure_author!
    redirect_to admin_news_index_path, notice: 'Recurso no Autorizado' if @news.author_id != current_user.id
  end
end
