Rails.application.routes.draw do
  resources :portfolios do
    resources :favorites, only: [:create, :destroy]
  end
  resources :profiles
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'tops#home'
  devise_for :users
  resources :conversations do
    resources :messages
  end
end
