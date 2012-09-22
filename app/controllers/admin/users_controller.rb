class Admin::UsersController < Admin::BaseController
  before_filter :valid_user_role!, only: [:update, :create]
  authorize_resource
  
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
  
  def new
    @user = User.new
  end
  
  def create
    generated_password = Devise.friendly_token.first(6)
    @user = User.new(params[:user])
    @user.password = generated_password
    @user.password_confirmation = generated_password
    if @user.save
      UserRegistration.welcome(@user, generated_password).deliver
      redirect_to admin_users_path, notice: 'Creado Correctamente'
    else
      render :new
    end
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def update
    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      redirect_to admin_users_path, notice: 'Actualizado Correctamente'
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to admin_users_path, notice: 'Eliminado Correctamente'
  end
  
  private
  def valid_user_role!
    if params[:user][:role] == 'super_admin'
      authorize! :assign_super_admin_role, current_user
    end
  end
end
