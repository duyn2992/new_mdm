# frozen_string_literal: true

class Api::V1::DevicesController < Api::V1::CrudController
  private

  def resource_params
    params.require(:device).permit(:serial_number, :device_type, :user_id)
  end
end
