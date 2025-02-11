# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::CrudController
  private

  def resource_params
    params.require(:user).permit(:email, organization_ids: [])
  end

  def update_associations(user)
    if resource_params[:organization_ids].present?
      user.organizations = Organization.where(id: resource_params[:organization_ids])
    end
  end
end
