class Reader < ActiveRecord::Base
  has_many :interpretations
  has_many :cards, :through => :interpretations
  has_many :suits, :through => :cards
  has_many :decks, :through => :cards
  has_many :traditions, :through => :decks
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def active_for_authentication?
    super && active?
  end
end
