class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_reader_or_querent
  layout 'back_room'
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :password, :password_confirmation, :first_name, :last_name, :moniker, :sign_mailing_list)
    end
  end
  
  def authenticate_reader_or_querent
    unless current_querent or current_reader
      authenticate_reader!
    end
  end
  
  def after_sign_in_path_for resource
    if resource.is_a? Querent
      events_path
    elsif resource.is_a? Reader
      decks_path
    end
  end
end
