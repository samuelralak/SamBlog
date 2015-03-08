class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	after_filter :store_location

	def store_location
		# store last url as long as it isn't a /users path
		session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
	end

	def after_sign_in_path_for(resource)
		session[:previous_url] || root_path
	end

	private
		def after_sign_out_path_for(resource_or_scope)
			puts "#### PREVIOUS URL: #{request.headers["HTTP_REFERER"]}"
			session[:previous_url] || request.headers["HTTP_REFERER"] || root_path
		end

	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.for(:sign_up) { |u| 
				u.permit(
					:fullname, :avatar, :email, :password, :password_confirmation, :provider, :uid
				) 
			}
		end
end
