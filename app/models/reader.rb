class Reader < ActiveRecord::Base
  has_many :interpretations
  has_many :cards, -> { uniq }, :through => :interpretations
  has_many :suits, -> { uniq }, :through => :cards
  has_many :decks, -> { uniq }, :through => :cards
  has_many :traditions, -> { uniq }, :through => :decks
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def active_for_authentication?
    super && active?
  end
end
