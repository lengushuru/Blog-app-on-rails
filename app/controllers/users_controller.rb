class UsersController < ApplicationController
  def index 
      @users = User.all
  end

  def show
      @user = User.find_by(id: params[:id])

      redirect_to root_path, alert: 'User Not Found' if
      @user.nil?
  end
end