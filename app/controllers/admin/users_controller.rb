class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  
end
