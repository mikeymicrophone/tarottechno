class Event < ApplicationRecord
  has_many :lines
  has_many :readers, :through => :lines
  has_many :readings
end
