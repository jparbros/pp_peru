module CmsDeviseAuth
  def authenticate
    redirect_to root_path unless current_user.admin_access?
  end
end