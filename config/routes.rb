Rails.application.routes.draw do
	post '/new_comment/:post_id', to: 'comments#add_comment', as: 'add_new_comment'
	# delete '/items/:item_id/delete_image/:id', to: 'items#destroy_image', as: 'destroy_image'

	
	devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
	devise_for :admins

	resources :posts
	root 'posts#index'
end
