class Admin::UsersController < Admin::BaseController
  before_filter :valid_user_role!, only: [:update, :create]
  authorize_resource
  
  def index
    @users = if params[:q]
        User.where("name like ? or email like ?", "%#{params[:q]}%", "%#{params[:q]}%").page(params[:page])
      else
        User.page(params[:page])
      end
    respond_to do |format|
      format.html
      format.json{ render json: @users.map(&:group_search) }
    end
  end
#  @posts = Post.paginate(:page => params[:page])

  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    generated_password = user_password
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
    if params[:user][:role_id] == 1
      authorize! :assign_super_admin_role, current_user
    end
  end
  
  def user_password
    if params[:user][:password].empty?
      generated_password = Devise.friendly_token.first(6)
      @user.password = generated_password
      @user.password_confirmation = generated_password
    else
      params[:user][:password]
    end
  end
end
