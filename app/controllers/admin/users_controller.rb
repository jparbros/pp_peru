class Admin::UsersController < Admin::BaseController
  
  def index
    @users = if params[:q]
        User.where("name like ?", "%#{params[:q]}%")
      else
        User.all
      end
    respond_to do |format|
      format.html
      format.json{ render json: @users.map(&:attributes) }
    end
  end
end
