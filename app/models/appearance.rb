class Appearance < ActiveRecord::Base
  belongs_to :reading
  has_one :reader, :through => :reading
  belongs_to :card
  belongs_to :position
  has_many :interpretations
  
  def name
    "#{card.name} in #{position.name} during #{reading.name}"
  end
end
