class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]
  before_action :is_current_user?, only: [:show, :edit]
  skip_before_action :protect_from_forgery, raise: false
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.first_name = user_edit[:first_name]
    @user.last_name = user_edit[:last_name]
    @user.address = user_edit[:address]
    @user.city = user_edit[:city]
    @user.zip_code = user_edit[:zip_code]
    if @user.save
      redirect_to user_path(@user.id)
      flash[:success] = "Profil modifié avec succès !"
    else
      redirect_to user_path(@user.id)
      flash[:info] = "Oups, il y a eu un soucis dans la mise à jour, les données ne se sont pas mises à jour"
    end
  end

  private
  def user_edit 
    params.require(:user).permit(:first_name, :last_name, :address, :city, :zip_code) 
  end

end