Rails.application.routes.draw do
  resources :posts

  devise_for :admins
end
