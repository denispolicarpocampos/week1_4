Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'user/registrations' }
  root "timelines#index"

  resources :users, only: :show do
    resources :follows, only: :create
  end

  resources :posts, only: [:create, :edit, :update]
  resources :follows, only: :destroy
  resources :searches, only: :index
  resources :timelines, only: :index

end
