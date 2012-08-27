class Admin::NewsController < Admin::BaseController

  def index
    @news = ::News.all
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

  def find_news(id_news)
    ::News.find(id_news)
  end
  
  def ensure_author!
    redirect_to admin_news_index_path, notice: 'Recurso no Autorizado' if @news.author_id != current_user.id
  end
end
