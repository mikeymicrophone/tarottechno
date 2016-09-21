class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_reader_or_querent
  before_action :secure_the_data
  layout 'back_room'
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :avatar, :password, :password_confirmation, :first_name, :last_name, :moniker, :sign_mailing_list, :phone)
    end
  end
  
  def authenticate_reader_or_querent
    unless current_querent or current_reader
      authenticate_reader!
    end
  end
  
  def after_sign_in_path_for resource
    if resource.is_a? Querent
      event_path(Event.last)
    elsif resource.is_a? Reader
      decks_path
    end
  end
  
  def secure_the_data
    return if editor_present? || current_reader
    if action_name == 'edit' || action_name == 'update'
      if ['places'].include? controller_name
        return
      end
      redirect_to root_url
    end
  end
  
  def editor_present?
    current_reader&.email = ENV['EDITOR_EMAIL_ADDRESS']
  end
  
  helper_method :editor_present?
end
