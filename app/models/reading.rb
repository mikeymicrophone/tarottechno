class Reading < ApplicationRecord
  belongs_to :event
  belongs_to :reader
  belongs_to :querent
  belongs_to :deck
  belongs_to :spread
  has_many :appearances
  
  scope :not_private, lambda { where(:private => false) }
  
  def name
    "#{querent.name}'s reading from #{reader.name} at #{event.name}"
  end
  
  def line
    event.lines.where(:reader_id => reader.id).first
  end
end
