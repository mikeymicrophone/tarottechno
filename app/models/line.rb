class Line < ApplicationRecord
  belongs_to :event, :required => true
  belongs_to :reader, :required => true
  has_many :places
  
  scope :randomized, lambda { order("random()") }
  
  def name
    "#{reader.moniker_or_name} at #{event.name}"
  end
  
  def notify_next_querent
    place = places.unfinished.order(:ordering).first
    place&.notify_querent
  end
end
