class Suit < ActiveRecord::Base
  extend CriticalPath
  has_many :cards
  has_many :decks, :through => :cards
  has_many :suits, :through => :cards
  has_many :interpretations, :through => :cards
  has_many :readers, :through => :interpretations
  
  scope :regarding_tradition, lambda { |tradition| joins(:decks).where 'decks.tradition_id' => tradition }
  scope :regarding_deck, lambda { |deck| joins(:cards).where 'cards.deck_id' => deck }
  scope :regarding_reader, lambda { |reader| joins(:interpretations).where 'interpretations.reader_id' => reader }
end
