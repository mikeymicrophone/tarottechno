class Position < ApplicationRecord
  belongs_to :spread
  has_many :appearances
  
  scope :sequenced, lambda { order :ordering }
  scope :filled, lambda { |reading| joins(:appearances).where('appearances.reading_id' => reading.id) }
  
  acts_as_list :scope => :spread_id, :column => :ordering
end
