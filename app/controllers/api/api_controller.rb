module Api
  class ApiController < ActionController::Base
    def bad_request(errors)
      render status: :bad_request, json: { errors: errors }
    end

    def unauthorized
      head :unauthorized
    end
  end
end
