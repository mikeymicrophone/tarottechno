class Place < ApplicationRecord
  belongs_to :line
  belongs_to :querent
  
  acts_as_list :scope => :line_id, :column => :ordering
end
