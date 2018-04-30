class Api::V1::UsersController < ApplicationController
  include PermitGrantable
  include RoleGrantable

  before_action :load_user, only: %i(show destroy)

  def create
    respond_with @user = User.create(strong_params), location: location
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

  def destroy
    respond_with @user.destroy, location: location
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def strong_params
    params.require(:user).permit(:email, :name)
  end

  def location
    url_for(%i(v1 users))
  end
end
