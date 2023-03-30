class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @users = User.all
  end 

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path, notice: "User #{user.email} has been deleted."
  end

end
