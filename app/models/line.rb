class Line < ApplicationRecord
  belongs_to :event
  belongs_to :reader
  has_many :places
  
  def name
    "#{reader.moniker_or_name} at #{event.name}"
  end
end
