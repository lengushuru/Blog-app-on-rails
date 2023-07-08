class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    # @posts = @user.Post
  end
end
