class Api::V1::RolesController < ApplicationController
  include PermitGrantable

  def create
    respond_with @role = Role.create(strong_params), location: url_for(%i(v1 roles))
  end

  def index
    respond_with @roles = Role.includes(%i(permissions role_permissions)).all
  end

  private

  def strong_params
    params.require(:role).permit(:name)
  end
end
