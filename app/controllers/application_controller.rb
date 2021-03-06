class ApplicationController < ActionController::Base
	# before_action :configure_permitted_parameters, if: :devise_controller?

helper_method :current_cart

before_action :configure_permitted_parameters, if: :devise_controller?
def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
end

def after_sign_in_path_for(resource)
    case resource

    when User

    user_items_path

    when Admin

 	  admin_users_path

    end
end

private

def after_sign_out_path_for(resource)

         user_items_path
end

protected

def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :kana , :email, :phone_number, :postal_code, :home_address])
end

end

