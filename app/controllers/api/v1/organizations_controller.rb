# frozen_string_literal: true

class Api::V1::OrganizationsController < Api::V1::CrudController
  private

  def resource_params
    params.require(:organization).permit(:name, user_ids: [])
  end

  def update_associations(organization)
    if resource_params[:user_ids].present?
      organization.users = User.where(id: resource_params[:user_ids])
    end
  end
end
