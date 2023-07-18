class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  # def after_sign_in_path_for(resource)
  #   if resource.authentication_method == :google
  #     user_path(resource)
  #   else
  #     user_url(resource)
  #   end
  # end
  def after_sign_in_path_for(user)
    user_path(user)
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :company_name, :industry])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  # def after_sign_up_path_for(resource)
  #   if resource.authentication_method == :google
  #     user_path(resource)
  #   else
  #     user_url(resource)
  #   end
  # end
  def after_sign_up_path_for(user)
    user_url(user)
  end
end
