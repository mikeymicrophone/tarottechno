class Appearance < ActiveRecord::Base
  belongs_to :reading
  belongs_to :card
  belongs_to :position
end
