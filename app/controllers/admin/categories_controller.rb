class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  
  def index
    @user = User.all
  end
  private

end
