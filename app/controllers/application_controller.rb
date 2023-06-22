class ApplicationController < ActionController::API
        include Authorization

        before_action :authenticate_with_token
        before_action :configure_permitted_parameters, if: :devise_controller?

        include DeviseTokenAuth::Concerns::SetUserByToken

        def configure_permitted_parameters
                added_attrs = [:email, :password, :password_confirmation, :nickname, :admin]
                devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
                devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        end
end
