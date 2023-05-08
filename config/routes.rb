Rails.application.routes.draw do
  get 'reservations/index'
  post 'reservations/confirm' # 予約確認画面
  get 'rooms/index'
  get 'users/index'
  get "users/profile" # ユーザープロフィール画面
  root to: "users#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  resources :users, only: [:show, :edit, :update]
  resources :rooms
  resources :reservations do
    member do
      patch 'edit_confirm' # 再予約(予約の編集)確認画面
    end
  end
end
