# frozen_string_literal: true

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq" if defined?(Sidekiq)
  mount Rswag::Ui::Engine => "/api/docs"
  mount Rswag::Api::Engine => "/api/docs"

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :devices, except: [:new, :edit]
      resources :organizations, except: [:new, :edit]
      resources :users do
        member do
          patch :restore
        end
      end

      resources :devices do
        member do
          patch :restore
        end
      end
    end
  end
end
