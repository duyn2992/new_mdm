# frozen_string_literal: true

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq" if defined?(Sidekiq)
  mount Rswag::Ui::Engine => "/api/docs"
  mount Rswag::Api::Engine => "/api/docs"

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :organizations, only: [:index, :create, :update]
      resources :users, only: [:index, :create, :update]
      resources :devices, only: [:index, :create, :update]
    end
  end
end
