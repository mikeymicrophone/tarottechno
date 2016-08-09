class Appearance < ActiveRecord::Base
  belongs_to :reading
  belongs_to :card
  belongs_to :position
  
  def name
    "#{card.name} in #{position.name} during #{reading.name}"
  end
end
