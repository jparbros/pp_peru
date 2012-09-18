class Admin::GroupsController < Admin::BaseController
  
  def index
    @groups = current_user.owned_groups
    @groups = if params[:q]
        current_user.owned_groups.where("name like ?", "%#{params[:q]}%")
      else
        current_user.owned_groups
      end
    respond_to do |format|
      format.html
      format.json{ render json: @groups.map(&:attributes) }
    end
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(params[:group])
    @group.owner = current_user
    if @group.save
      redirect_to admin_groups_path, notice: 'Creado Correctamente'
    else
      render :new
    end
  end
  
  def edit
    @group = Group.find params[:id]
  end
  
  def update
    @group = Group.find params[:id]
    if @group.update_attributes(params[:discussion])
      redirect_to admin_groups_path, notice: 'Actualizado Correctamente'
    else
      render :edit
    end
  end
  
  def destroy
    @group = Group.find params[:id]
    @group.destroy
    redirect_to admin_groups_path, notice: 'Eliminado Correctamente'
  end
end
