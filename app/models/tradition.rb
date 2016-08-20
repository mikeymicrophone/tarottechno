class Tradition < ApplicationRecord
  has_many :decks
  has_many :spreads
  has_many :cards, -> { uniq }, :through => :decks
  has_many :suits, -> { uniq }, :through => :cards
  has_many :interpretations, -> { uniq }, :through => :cards
end
