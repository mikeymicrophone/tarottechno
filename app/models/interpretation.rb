class Interpretation < ActiveRecord::Base
  belongs_to :card
  belongs_to :reader
  
  def reader_moniker
    reader.try :moniker
  end
end
