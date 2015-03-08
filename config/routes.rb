Rails.application.routes.draw do
	post   '/new_comment/:post_id',     to: 'comments#add_comment',       as: 'add_new_comment'
	post   '/child_comment/:parent_id', to: 'comments#add_child_comment', as: 'reply_to_comment'
	delete '/comment/:id',              to: 'comments#remove_comment',    as: 'delete_comment'

	
	devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
	devise_for :admins

	resources :posts
	root 'posts#index'
end
