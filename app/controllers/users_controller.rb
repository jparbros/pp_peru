class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @current_user = current_user #TODO no funciona el current_user con public activity
  end
end