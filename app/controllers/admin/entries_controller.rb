class Admin::EntriesController < Admin::BaseController
  before_filter :find_entry, only: [:edit, :show, :detroy, :update]
  before_filter :ensure_author!, only: [:edit, :show, :detroy, :update]
  respond_to :html, :js
  
  def index
    @entries = Entry.by_author(current_user)
  end
  
  def new
    @entry = Entry.new
  end
  
  def create
    @entry = Entry.new(params[:entry])
    @entry.author = current_user
    if @entry.save
      redirect_to admin_entries_path, notice: 'Creado Correctamente'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def show
  end
  
  def destroy
    @entry.destroy
    redirect_to admin_entries_path, notice: 'Eliminado Correctamente'
  end
  
  def update
    if @entry.update_attributes(params[:entry])
      redirect_to admin_entries_path, notice: 'Actualizado Correctamente'
    else
      render :edit
    end
  end
  
  def topics
    @topics = Topic.order(:name)
    respond_to do |format|
      format.json{ render json: @topics.tokens(params[:q])}
    end
  end

  private 
  
  def find_entry
    @entry = Entry.find(params[:id])
  end
  
  def ensure_author!
    redirect_to admin_entries_path, notice: 'Recurso no Autorizado' if @entry.author_id != current_user.id
  end
end
