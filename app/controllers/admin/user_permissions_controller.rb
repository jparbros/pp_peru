class Admin::UserPermissionsController < Admin::BaseController
  before_filter :find_user
  authorize_resource
  def index
    @permissions = UserPermission.all.group_by(&:subject_class) #TODO move to presenter
    @user_permission_ids = @user.user_permissions.map(&:id)
  end
  
  def create
    @user.update_attributes(user_permission_ids: params[:user_permission_ids])
    redirect_to :admin_users, notice: 'Los permisos se han actualizado correctamente'  
  end
  
  private
  def find_user
    @user = User.find(params[:user_id])
  end
end
