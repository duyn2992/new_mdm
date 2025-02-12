# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend
  include CommonResponse
  include ErrorCode
  include NotificationService

  rescue_from ArgumentError, with: :handle_argument_error

  private

  def handle_argument_error(exception)
    if exception.message.include?("is not a valid")
      response_error({}, UNPROCESSABLE_ENTITY, exception.message)
    else
      raise exception
    end
  end
end
