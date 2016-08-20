class Spread < ApplicationRecord
  belongs_to :tradition
  has_many :readings
  has_many :positions
end
