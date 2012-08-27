class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :only_admin_user!
  private

  def only_admin_user!
    redirect_to root_path unless current_user.admin?
  end
end
