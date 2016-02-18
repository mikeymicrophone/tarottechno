class Interpretation < ActiveRecord::Base
  belongs_to :card
  belongs_to :reader
end
