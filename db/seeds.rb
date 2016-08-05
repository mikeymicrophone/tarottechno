# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@book_of_fate = Tradition.create :name => 'Book of Fate'
@tarot = Tradition.create :name => 'Tarot'

@playing_cards = Deck.create :name => 'Playing Cards', :tradition => @book_of_fate
@tarot_cards = Deck.create :name => 'Tarot Deck', :tradition => @tarot

@hearts = Suit.create :name => 'Hearts'
@diamonds = Suit.create :name => 'Diamonds'
@clubs = Suit.create :name => 'Clubs'
@spades = Suit.create :name => 'Spades'
@no_suit = Suit.create :name => 'No Suit'
@wands = Suit.create :name => 'Wands'
@pentacless = Suit.create :name => 'Pentacles'
@cups = Suit.create :name => 'Cups'
@swords = Suit.create :name => 'Swords'

order = 1
['Hearts', 'Clubs', 'Diamonds', 'Spades'].each do |suit_name|
  ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King'].each do |face|
    suit = Suit.find_by_name suit_name
    Card.create :suit => suit, :name => "#{face} of #{suit_name}", :order => order
    order = order + 1
  end
end
Card.create :suit => @no_suit, :name => 'Joker', :order => order

order = 1
['The Fool', 'The Magician', 'The High Priestess', 'The Empress', 'The Emperor', 'The Hierophant', 'The Lovers', 'The Chariot',
  'Strength', 'The Hermit', 'Wheel of Fortune', 'Justice', 'The Hanged Man', 'Death', 'Temperance', 'The Devil', 'The Tower',
  'The Star', 'The Moon', 'The Sun', 'Judgement', 'The World'].each do |arcana|
    Card.create :suit => @no_suit, :name => arcana, :order => order
    order = order + 1
end

['Wands', 'Pentacles', 'Cups', 'Swords'].each do |suit_name|
  ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Page', 'Jack', 'Queen', 'King'].each do |face|
    suit = Suit.find_by_name suit_name
    Card.create :suit => suit, :name => "#{face} of #{suit_name}", :order => order
    order = order + 1
  end
end
