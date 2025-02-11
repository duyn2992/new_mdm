# frozen_string_literal: true

class Api::V1::CrudController < ApplicationController
  def index
    resources = resource_class.ransack(params[:q]).result
    pagy, = pagy(
      resources,
      limit: params[:limit] || Settings.limit.default,
      page: params[:page] || Settings.page.default
    )
    response_success(
      {
        resource_key => resources.map do |resource|
          serializer_class.new(resource).as_json
        end,
        pagy: pagy_metadata(pagy)
      }
    )
  end

  def create
    resource = resource_class.new(resource_params)
    update_associations(resource) if respond_to?(:update_associations, true)

    if resource.save
      response_success({singular_resource_key => serializer_class.new(resource).as_json})
    else
      unprocessable_entity(resource)
    end
  end

  def update
    resource = resource_class.find(params[:id])
    update_associations(resource) if respond_to?(:update_associations, true)

    if resource.update(resource_params)
      response_success({singular_resource_key => serializer_class.new(resource).as_json})
    else
      unprocessable_entity(resource)
    end
  end

  private

  def resource_class
    controller_name.classify.constantize
  end

  def serializer_class
    "#{resource_class}Serializer".constantize
  end

  def resource_key
    resource_class.name.underscore.pluralize.to_sym
  end

  def singular_resource_key
    resource_class.name.underscore.to_sym
  end
end
