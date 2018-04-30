class Api::V1::PermissionsController < ApplicationController
  def index
    respond_with @permissions = Permission.all
  end

  def destroy
    @permission = Permission.find(params[:id])
    respond_with @permission.destroy, location: url_for(%i(v1 permissions))
  end
end
