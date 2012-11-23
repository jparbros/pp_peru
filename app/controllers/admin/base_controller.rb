class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :only_admin_user!
  private

  def only_admin_user!
    redirect_to root_path unless current_user.admin_access?
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_root_path, :alert => 'No estas Autorizado para ver esta pagina'
  end
end
