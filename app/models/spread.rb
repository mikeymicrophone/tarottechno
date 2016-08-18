class Spread < ActiveRecord::Base
  belongs_to :tradition
  has_many :readings
  has_many :positions
end
