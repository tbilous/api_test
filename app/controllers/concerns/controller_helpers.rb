module ControllerHelpers
  extend ActiveSupport::Concern

  private

  def model_klass
    controller_name.classify.constantize
  end

  def send_response(_object, success, error)
    if success
      render json: {}, status: 200
    else
      render json: { error: error }.to_json, status: :unprocessable_entity
    end
  end
end
