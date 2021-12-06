Rails.application.routes.draw do
  root 'tops#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :profiles
  resources :links
  resources :portfolios do
    resources :favorites, only: [:create, :destroy,:index]
  end
  resources :conversations do
    resources :messages
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
