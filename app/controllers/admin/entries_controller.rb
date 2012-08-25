class Admin::EntriesController < Admin::BaseController
  respond_to :html, :js
  
  def index
    @entries = Entry.all
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
    @entry = find_entry(params[:id])
  end
  
  def show
    @entry = find_entry(params[:id])
  end
  
  def destroy
    @entry = find_entry(params[:id])
    @entry.destroy
    redirect_to admin_entries_path, notice: 'Eliminado Correctamente'
  end
  
  def update
    @entry = find_entry(params[:id])
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
  
  def find_entry(id_entry)
    Entry.find(id_entry)
  end
end
