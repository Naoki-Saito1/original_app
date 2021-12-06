Rails.application.routes.draw do
  root 'tops#home'
  devise_for :users
  resources :profiles
  resources :links
  resources :portfolios do
    resources :favorites, only: [:create, :destroy,:index]
  end
  resources :conversations do
    resources :messages
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  
  end
end
