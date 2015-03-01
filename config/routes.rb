Rails.application.routes.draw do
  resources :posts
  
  devise_for :users
  devise_for :admins

  root 'posts#index'
end
