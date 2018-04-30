module TypePermitable
  include ControllerHelpers
  extend ActiveSupport::Concern

  included do
    def create
      respond_with @permit = model_klass.create(strong_params), location: url_for(%i(v1 permissions))
    end

    private

    def strong_params
      params.require(:permission).permit(:slug)
    end
  end
end
