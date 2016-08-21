class Reading < ApplicationRecord
  belongs_to :event
  belongs_to :reader
  belongs_to :querent
  belongs_to :deck
  belongs_to :spread
  has_many :appearances
  
  def name
    "reading from #{reader.name} at #{event.name}"
  end
end
