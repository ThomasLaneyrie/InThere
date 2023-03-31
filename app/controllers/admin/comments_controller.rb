class Admin::CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_if_admin

    def index
        @user = User.find(params[:user_id])
        @comments = Comment.where(user: @user)
    end
end
