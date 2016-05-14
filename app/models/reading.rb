class Reading < ActiveRecord::Base
  belongs_to :event
  belongs_to :reader
  belongs_to :subject, :class_name => 'Reader'
end
