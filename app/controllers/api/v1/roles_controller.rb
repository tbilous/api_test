class Api::V1::RolesController < ApplicationController
  include PermitGrantable

  def create
    respond_with @role = Role.create(strong_params), location: location
  end

  def index
    respond_with @roles = Role.includes(%i(permissions role_permissions)).all
  end

  def destroy
    @role = Role.find(params[:id])
    respond_with @role.destroy, location: location
  end

  private

  def location
    url_for(%i(v1 roles))
  end

  def strong_params
    params.require(:role).permit(:name)
  end
end
