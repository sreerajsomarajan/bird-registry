require 'api_constraints'

Rails.application.routes.draw do
  root 'birds#index'

  namespace :apis, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :birds, except: [:update]
    end
  end
end

