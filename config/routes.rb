Rails.application.routes.draw do
  root 'tops#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :profiles
  resources :links
  resources :portfolios do
    resources :favorites, only: %i[create destroy index]
  end
  resources :conversations do
    resources :messages
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_sign_in_admin'
    post 'users/guest_corporate_sign_in', to: 'users/sessions#guest_sign_in_corporate'
  end
end
