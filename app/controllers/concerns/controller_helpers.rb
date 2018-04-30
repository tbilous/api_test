module ControllerHelpers
  extend ActiveSupport::Concern

  private

  def model_klass
    controller_name.classify.constantize
  end
end
