class Admin::DiscussionsController < Admin::BaseController
  before_filter :find_discussion, only: [:edit, :show, :destroy, :update]
  #before_filter :ensure_author!, only: [:edit, :show, :detroy, :update]
  authorize_resource
  
  def index
    @discussions = Discussion.by_permissions(current_user).recents
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
  end
  
  def show
  end
  
  def destroy
    @discussion.destroy
    redirect_to admin_discussions_path, notice: 'Eliminado Correctamente'
  end
  
  def update
    if @discussion.update_attributes(params[:discussion])
      redirect_to admin_discussions_path, notice: 'Actualizado Correctamente'
    else
      render :edit
    end
  end
  
  private 
  
  def find_discussion
    @discussion = Discussion.find(params[:id])
  end
  
  def ensure_author!
    redirect_to admin_discussion_path, notice: 'Recurso no Autorizado' if @discussion.author_id != current_user.id
  end
end
