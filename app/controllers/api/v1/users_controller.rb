# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  def index
    query = User.ransack(params[:q])

    pagy, users = pagy(
      query.result.order(created_at: :desc),
      limit: params[:per_page] || Settings.per_page.default,
      page: params[:page] || Settings.page.default
    )

    response_success({users: users.map { |user| UserSerializer.new(user).as_json }, pagy:})
  end
end
