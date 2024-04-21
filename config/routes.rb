# frozen_string_literal: true

Rails.application.routes.draw do
  resources :addresses
  namespace :admin do
    resources :countries
    resources :states
  end

  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout" }, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
  root "home#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
