# config/routes.rb

Rails.application.routes.draw do
  # Devise routes for authentication
  devise_for :users

  # Non-versioned resources
  resources :users, only: [:show, :edit, :update, :destroy, :create]

  # Versioned resources
  namespace :v1 do
    resources :applicants do
      member do
        post 'categorize'
      end
    end
  end

  # Root path
  root to: "v1/applicants#index"
end
