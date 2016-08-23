class Appearance < ApplicationRecord
  belongs_to :reading
  has_one :reader, :through => :reading
  belongs_to :card
  belongs_to :position
  has_many :interpretations
  
  def name
    "#{card.name} as #{position.name} during #{reading.name}"
  end
  
  def card_in_position
    "#{card.name + (reversed ? ' (reversed)' : '')} as #{position&.name || description}"
  end
end
