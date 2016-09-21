class Place < ApplicationRecord
  belongs_to :line
  belongs_to :querent
  
  acts_as_list :scope => :line_id, :column => :ordering
  
  scope :unfinished, lambda { where(:complete => nil) }
  
  def notify_querent
    begin
      number = querent.phone
      return if number.blank?
      @client = Twilio::REST::Client.new ENV['TWILIO_ID'], ENV['TWILIO_TOKEN']
      @client.account.messages.create({
        :from => '+14849483191',
        :to => "+#{number}",
        :body => "Your reading with #{reader.name} will begin in 5-10 minutes. #{line.position_in_room? ? l.position_in_room : ''} Fate isn't late"
      })
    rescue StandardError => error
      Rails.logger.info "A text message failed to send: #{error.message}"
    end
  end
end
