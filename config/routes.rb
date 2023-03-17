Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :friendships
    post 'users/:user_id/friendship', to: 'friendships#add_friend'# , :as 'friendship'
  end
  resources :companies
  resources :posts do
    resources :comments do
      resources :comments
    end
  end

  resources :comments do
    resources :comments 
  end
  # post '/auth/login', to: 'authentication#login'
end
