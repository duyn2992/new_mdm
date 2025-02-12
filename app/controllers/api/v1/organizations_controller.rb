# frozen_string_literal: true

class Api::V1::OrganizationsController < Api::V1::CrudController
  private

  def resource_params
    params.require(:organization).permit(:name, user_ids: [])
  end
end
