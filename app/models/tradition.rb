class Tradition < ActiveRecord::Base
  has_many :decks
  has_many :cards, :through => :decks
  has_many :suits, :through => :cards
  has_many :interpretations, :through => :cards
end
