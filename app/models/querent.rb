class Querent < ApplicationRecord
  has_many :readings
  
  attr_accessor :sign_mailing_list
  
  after_create :copy_to_mailing_list
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_not_in_line line
    line.places.where(:querent_id => id).empty?
  end
  
  def copy_to_mailing_list
    if sign_mailing_list
      gibbon = Gibbon::Request.new :api_key => ENV['MAILCHIMP_API_KEY']
      mail_list = gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.create :body => {:email_address => email, :status => 'subscribed'}
    end
  end
         
  def name
    moniker_or_name
  end

  def moniker_or_name
    if moniker.present?
      moniker
    else
      "#{first_name} #{last_name}"
    end
  end
end
