require 'api_constraints'

Rails.application.routes.draw do
  root 'apis/v1/birds#index'

  namespace :apis, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :birds, except: [:update]
    end
  end

  # Any other routes are handled here
  # (as ActionDispatch prevents RoutingError from hitting
  # ApplicationController::rescue_action).
  match '*path', to: 'application#routing_error', via: :all
end

