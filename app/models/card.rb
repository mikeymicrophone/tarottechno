class Card < ApplicationRecord
  extend CriticalPath
  belongs_to :deck
  belongs_to :suit
  has_many :interpretations, -> { uniq }
  has_many :readers, -> { uniq }, :through => :interpretations
  has_one :tradition, -> { uniq }, :through => :deck
  
  scope :regarding_suit, lambda { |suit| where :suit_id => suit }
  scope :regarding_deck, lambda { |deck| where :deck_id => deck }
  scope :regarding_tradition, lambda { |tradition| joins(:deck).where 'decks.tradition_id' => tradition }
  scope :sequenced, lambda { order :ordering }
  
  acts_as_list :scope => :deck_id, :column => :ordering
end
