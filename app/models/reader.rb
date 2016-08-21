class Reader < ApplicationRecord
  has_many :interpretations
  has_many :cards, -> { uniq }, :through => :interpretations
  has_many :suits, -> { uniq }, :through => :cards
  has_many :decks, -> { uniq }, :through => :cards
  has_many :traditions, -> { uniq }, :through => :decks
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
         
  def active_for_authentication?
    super && active?
  end
  
  def name
    moniker_or_name
  end
  
  def moniker_or_name
    if moniker.present?
      moniker
    else
      "#{first_name} #{last_name}"
    end
  end
end
