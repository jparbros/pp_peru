class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @activities = PublicActivity::Activity.all
  end
end