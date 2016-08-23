class Interpretation < ApplicationRecord
  belongs_to :card
  belongs_to :appearance
  has_one :reading, :through => :appearance
  belongs_to :reader
  
  scope :private_reading, lambda { joins(:reading).where('readings.private' => true) }
  scope :not_private_reading, lambda { joins(:reading).where('readings.private' => false) }
  
  def reader_moniker
    reader.try :moniker
  end
end
