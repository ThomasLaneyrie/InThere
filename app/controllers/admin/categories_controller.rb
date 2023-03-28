class Admin::CategoriesController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!, :check_if_admin
  
  def index
    @user = User.all
  end
  private
  def check_if_admin
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, danger: "Vous ne pouvez pas accéder à cette page, n'étant pas administrateur, désolé !"
    end
  end
end
