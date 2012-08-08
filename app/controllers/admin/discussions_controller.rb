class Admin::DiscussionsController < Admin::BaseController
  
  def index
    @discussions = Discussion.all
  end
  
  def new
    @discussion = Discussion.new
  end
  
  def create
    @discussion = Discussion.new(params[:discussion])
    @discussion.author = current_user
    if @discussion.save
      redirect_to admin_discussions_path, notice: 'Creado Correctamente'
    else
      render :new
    end
  end
  
  def edit
    @discussion = find_discussion(params[:id])
  end
  
  def show
    @discussion = find_discussion(params[:id])
  end
  
  def destroy
    @discussion = find_discussion(params[:id])
    @discussion.destroy
    redirect_to admin_discussions_path, notice: 'Eliminado Correctamente'
  end
  
  def update
    @discussion = find_discussion(params[:id])
    if @discussion.update_attributes(params[:discussion])
      redirect_to admin_discussions_path, notice: 'Actualizado Correctamente'
    else
      render :edit
    end
  end
  
  private 
  
  def find_discussion(id_discussion)
    Discussion.find(id_discussion)
  end
end
