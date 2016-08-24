class Line < ApplicationRecord
  belongs_to :event
  belongs_to :reader
  has_many :places
  
  def name
    "#{reader.moniker_or_name} at #{event.name}"
  end
  
  def notify_next_querent
    querent = places.unfinished.order(:ordering).first&.querent
    number = querent.phone
    return if querent.phone.blank?
    
    begin
      @client = Twilio::REST::Client.new ENV['TWILIO_ID'], ENV['TWILIO_TOKEN']
      @client.account.messages.create({
        :from => '+14849483191',
        :to => "+#{number}",
        :body => "Your reading with #{reader.name} will begin in 5. Fate isn't late"
      })
    rescue StandardError => error
      Rails.logger.info "A text message failed to send: #{error.message}"
    end
  end
end
