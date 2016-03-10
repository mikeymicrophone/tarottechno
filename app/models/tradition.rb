class Tradition < ActiveRecord::Base
  has_many :decks
  has_many :cards, -> { uniq }, :through => :decks
  has_many :suits, -> { uniq }, :through => :cards
  has_many :interpretations, -> { uniq }, :through => :cards
end
