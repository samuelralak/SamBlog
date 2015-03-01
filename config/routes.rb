Rails.application.routes.draw do
  resources :posts

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  devise_for :admins

  root 'posts#index'
end
