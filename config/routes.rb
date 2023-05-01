Rails.application.routes.draw do
  get 'users/index'
  get "users/profile"
  root to: "users#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :users, only: [:show, :edit, :update]
end
