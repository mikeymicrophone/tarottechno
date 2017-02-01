class LogisticsController < ApplicationController
  skip_before_action :authenticate_reader_or_querent
  layout 'front_page'
  
  def dj_guildlines
    
  end
  
  def reader_guildlines
    
  end
end
