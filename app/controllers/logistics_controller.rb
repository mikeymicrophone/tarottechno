class LogisticsController < ApplicationController
  skip_before_action :authenticate_reader_or_querent
  layout 'front_page'
end
