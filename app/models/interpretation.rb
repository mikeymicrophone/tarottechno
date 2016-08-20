class Interpretation < ApplicationRecord
  belongs_to :card
  belongs_to :appearance
  belongs_to :reader
  
  def reader_moniker
    reader.try :moniker
  end
end
