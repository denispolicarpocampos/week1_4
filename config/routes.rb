Rails.application.routes.draw do


  devise_for :users
  root "home#index"

  resources :users, only: :show do
    resources :follows, only: :create
  end

  resources :posts, only: [:create, :edit, :update]
  resources :follows, only: :destroy

end
