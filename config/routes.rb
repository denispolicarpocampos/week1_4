Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'user/registrations' }
  root "timelines#index"

  resources :users, only: :show do
    resources :follows, only: :create
  end

  resources :posts, only: [:create, :edit, :update] do
    member do
      post :like
      delete :unlike
    end
  end

  resources :follows, only: :destroy
  resources :searches, only: :index
  resources :timelines, only: :index
  resources :trend_topics, only: :index

end
