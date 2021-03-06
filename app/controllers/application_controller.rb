class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
     (resource.admin_access? or resource.super_admin?) ? admin_root_path : root_path
  end
  
end
