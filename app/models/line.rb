class Line < ApplicationRecord
  belongs_to :event
  belongs_to :reader
end
