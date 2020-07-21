class ApplicationController < ActionController::Base
    before_action :store_user_location!, if: :storable_location?
    before_action :configure_permitted_parameters, if: :devise_controller?


    rescue_from CanCan::AccessDenied do |exception|
        if user_signed_in?
            redirect_to root_path, alert: "You are not authoriazed to view this page."
        else
            redirect_to new_user_session_path, alert: "You need to sign in to continue."
        end
    end

    def after_sign_in_path_for(resource_or_scope)
        stored_location_for(resource_or_scope) || super
    end

     private
        def storable_location?
            request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
        end

        def store_user_location!
            store_location_for(:user, request.fullpath)
        end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
            devise_parameter_sanitizer.permit(:account_update, keys: [:username])
        end
    
end
