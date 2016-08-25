class Querent < ApplicationRecord
  has_many :readings
  
  attr_accessor :sign_mailing_list
  
  scope :alphabetical, lambda { order('lower(moniker)') }
  
  after_create :copy_to_mailing_list
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_not_in_line line
    line.places.unfinished.where(:querent_id => id).empty?
  end
  
  def place_in_line line
    my_place_in_line = line.places.unfinished.where(:querent_id => id).first
    in_front_of_me = line.places.unfinished.where('ordering < ?', my_place_in_line.ordering).count
    return in_front_of_me + 1
  end
  
  def copy_to_mailing_list
    if sign_mailing_list == '1'
      begin
        gibbon = Gibbon::Request.new :api_key => ENV['MAILCHIMP_API_KEY']
        mail_list = gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.create :body => {:email_address => email, :status => 'subscribed'}
      rescue Gibbon::MailChimpError => mail_error
        Rails.logger.info mail_error
      end
    end
  end
         
  def name
    moniker_or_name
  end

  def moniker_or_name
    if moniker.present?
      "#{moniker} (#{first_name} #{last_name})"
    else
      "#{first_name} #{last_name}"
    end
  end
  
  # protected
  # def send_devise_notification(notification, *args)
  #   # Based on https://github.com/zapnap/resque_mailer/blob/64d2be9687e320de4295c1bd1b645f42bd547743/lib/resque_mailer.rb#L81
  #   # Mailer may completely skip Resque::Mailer in certain cases - and will fail as we write custom handle in DeviseResqueMailer assuming mails are handled via resque
  #   # So in those cases, don't retain original devise_mailer so things work properly
  #   if ActionMailer::Base.perform_deliveries && Resque::Mailer.excluded_environments.exclude?(Rails.env.to_sym)
  #     # Originally devise_mailer.send(notification, self, *args).deliver
  #     # Modified to ensure devise mails are safely sent via resque
  #     resource_id, resource_class = self.id, self.class.name
  #     devise_mailer.send(notification, {resource_id: resource_id, resource_class: resource_class}, *args).deliver
  #   else
  #     super
  #   end
  # end
end
