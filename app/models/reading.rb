class Reading < ActiveRecord::Base
  belongs_to :event
  belongs_to :reader
  belongs_to :subject, :class_name => 'Reader'
  belongs_to :deck
  belongs_to :spread
  
  def name
    "reading from #{reader.name} at #{event.name}"
  end
end
