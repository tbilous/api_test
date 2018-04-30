module RoleGrantable
  include ControllerHelpers
  extend ActiveSupport::Concern

  included do
    before_action :load_role, only: %i(grant_role remove_role)
  end

  def grant_role
    @resource = model_klass.find(params[:id])
    success, error = @resource.add_roles(@role)
    send_response(@resource, success, error)
  end

  def remove_role
    @resource = model_klass.find(params[:id])
    success, error = @resource.remove_roles(@role)
    send_response(@resource, success, error)
  end

  private

  def load_role
    @role = Role.find(params[:role_id])
  end
end
