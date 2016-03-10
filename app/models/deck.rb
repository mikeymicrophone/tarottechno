class Deck < ActiveRecord::Base
  extend CriticalPath
  belongs_to :tradition
  has_many :cards
  has_many :suits, :through => :cards
  has_many :interpretations, :through => :cards
  has_many :readers, :through => :interpretations
  
  scope :regarding_tradition, lambda { |tradition| where :tradition_id => tradition }
  scope :regarding_suit, lambda { |suit| joins(:cards).where 'cards.suit_id' => suit }
end
