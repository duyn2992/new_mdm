# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::CrudController
  private

  def resource_params
    params.require(:user).permit(:email, organization_ids: [])
  end
end
