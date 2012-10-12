class Admin::RolesController < Admin::BaseController
  authorize_resource
  def index
    @roles = Role.scoped
  end
end
