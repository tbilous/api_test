class Api::V1::PermissionsController < ApplicationController
  def index
    respond_with @permissions = Permission.all
  end
end
