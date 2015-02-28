Rails.application.routes.draw do
  resources :posts

  devise_for :admins

  root 'posts#index'
end
