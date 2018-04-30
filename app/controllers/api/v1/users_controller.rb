class Api::V1::UsersController < ApplicationController
  include PermitGrantable
  include RoleGrantable

  def create
    respond_with @user = User.create(strong_params), location: url_for(%i(v1 users))
  end

  def show
    respond_with @user = User.find(params[:id])
  end

  def index
    respond_with @users = User.all
  end

  def search
    respond_with @user = User.find_by_email(params[:user_email])
  end

  private

  def strong_params
    params.require(:user).permit(:email, :name)
  end
end
