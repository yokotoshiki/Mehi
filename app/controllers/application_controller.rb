class ApplicationController < ActionController::Base
	protected

	def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	    admin_recipe_categories_path
	  when User
	    root_path(resource)
	  end
	end

	def after_sign_out_path_for(resource)
	    new_session_path(resource)
	end

    protected
	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys:[:email,:password,:name])
	    devise_parameter_sanitizer.permit(:sign_in, keys:[:email,:password,:name])
	end
end
