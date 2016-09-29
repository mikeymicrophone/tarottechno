class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @identity = Identity.find_for_oauth env["omniauth.auth"]

    @querent = @identity.querent || current_querent
    if @querent.nil?
      @querent = Querent.create(:email => @identity.email)
      @identity.update_attribute(:querent_id, @querent.id)
    end

    if @querent.persisted?
      @identity.update_attribute(:querent_id, @querent.id)
      sign_in_and_redirect @querent, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_querent_registration_url
    end
  end
end
