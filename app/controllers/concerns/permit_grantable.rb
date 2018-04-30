module PermitGrantable
  include ControllerHelpers
  extend ActiveSupport::Concern

  included do
    before_action :load_permission, only: %i(grant_permission remove_permission)
    before_action :load_resource, only: %i(grant_permission remove_permission)
  end

  def grant_permission
    @resource = model_klass.find(params[:id])
    @permission = Permission.find(params[:permission_id])
    success, error = @resource.add_permissions(@permission)
    send_response(@resource, success, error)
  end

  def remove_permission
    @resource = model_klass.find(params[:id])
    @permission = Permission.find(params[:permission_id])
    success, error = @resource.remove_permissions(@permission)
    send_response(@resource, success, error)
  end

  private

  def load_permission
    @permission = Permission.find(params[:permission_id])
  end

  def load_resource
    @resource = model_klass.find(params[:id])
  end
end
