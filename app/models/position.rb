class Position < ActiveRecord::Base
  belongs_to :spread
  
  scope :sequenced, lambda { order :ordering }
  
  acts_as_list :scope => :spread_id, :column => :ordering
end
