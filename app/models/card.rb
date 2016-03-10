class Card < ActiveRecord::Base
  extend CriticalPath
  belongs_to :deck
  belongs_to :suit
  has_many :interpretations
  has_many :readers, :through => :interpretations
  has_one :tradition, :through => :deck
  
  scope :regarding_suit, lambda { |suit| where :suit_id => suit }
  scope :regarding_deck, lambda { |deck| where :deck_id => deck }
  scope :regarding_tradition, lambda { |tradition| joins(:deck).where 'decks.tradition_id' => tradition }
end
