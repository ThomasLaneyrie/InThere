class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!, :check_if_admin
  
end
