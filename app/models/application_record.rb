class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.random
    offset(rand(count)).first
  end
end
