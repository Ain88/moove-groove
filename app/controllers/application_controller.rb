class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render file: "#{Rails.root}/app/views/layouts/custom_404.html", layout: true, status: :not_found
  end
        private

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :weight, :password, :password_confirmation])
          devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :email, :weight, :password, :password_confirmation])
          devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :weight, :password, :password_confirmation])
        end
end
