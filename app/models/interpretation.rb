class Interpretation < ApplicationRecord
  extend CriticalPath
  belongs_to :card
  belongs_to :appearance
  has_one :reading, :through => :appearance
  belongs_to :reader
  
  scope :regarding_suit, lambda { |suit| joins(:card).where 'cards.suit_id' => suit }
  scope :regarding_card, lambda { |card| where :card_id => card }
  scope :private_reading, lambda { joins(:reading).where('readings.private' => true) }
  scope :not_private_reading, lambda { joins(:reading).where('readings.private' => false) }
  
  def reader_moniker
    reader.try :moniker
  end
end
