module Permitable
  include ControllerHelpers
  extend ActiveSupport::Concern

  included do
    before_action :set_object, only: %i(grant_role grant_permission)
  end

  def grant_role
    success, error = @permitable.add_permissions(params[:role])
    send_response(@permitable.roles, success, error)
  end

  def grant_permission
    success, error = @permitable.add_role(params[:role])
    send_response(@permitable.permissions, success, error)
  end

  def send_response(object, success, error)
    if success
      render json: { rating: object, message: 'Success' }.to_json
    else
      render json: { error: error }.to_json, status: :unprocessable_entity
    end
  end

  def set_object
    @resource = model_klass.find(params[:id])
  end
end
