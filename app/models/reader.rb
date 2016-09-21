class Reader < ApplicationRecord
  has_many :interpretations
  has_many :cards, -> { uniq }, :through => :interpretations
  has_many :suits, -> { uniq }, :through => :cards
  has_many :decks, -> { uniq }, :through => :cards
  has_many :traditions, -> { uniq }, :through => :decks
  has_many :lines
  has_many :events, :through => :lines
  
  attr_accessor :sign_mailing_list
  
  scope :alphabetical, lambda { order('lower(moniker)') }
  
  after_create :copy_to_mailing_list
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
         
  def active_for_authentication?
    super && active?
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
      "#{first_name} \"#{moniker}\" #{last_name}"
    else
      "#{first_name} #{last_name}"
    end
  end
end
