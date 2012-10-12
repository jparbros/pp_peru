class Admin::RolePermissionsController < Admin::BaseController
  before_filter :find_role
  authorize_resource
  def index
    @permissions = RolePermission.all.group_by(&:subject_class) #TODO move to presenter
    @role_permission_ids = @role.role_permissions.map(&:id)
  end
  
  def create
    @role.update_attributes(role_permission_ids: params[:role_permission_ids])
    redirect_to :admin_roles, notice: 'Los permisos se han actualizado correctamente'  
  end
  
  private
  def find_role
    @role = Role.find(params[:role_id])
  end
end
