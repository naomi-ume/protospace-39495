class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_url_options
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:password,:password_confirmation,:profile,:occupation,:position])
  end
  def set_url_options
    ActiveStorage::Current.url_options = Rails.application.config.action_mailer.default_url_options
  end
end
