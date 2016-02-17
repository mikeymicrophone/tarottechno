class MailingController < ApplicationController
  def add_name
    gibbon = Gibbon::Request.new :api_key => ENV['MAILCHIMP_API_KEY']
    mail_list = gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.create :body => {:email_address => params[:email], :status => 'subscribed'}
    render :nothing => true
  end
end
