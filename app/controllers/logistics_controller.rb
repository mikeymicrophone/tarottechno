class LogisticsController < ApplicationController
  skip_before_action :authenticate_reader!
  layout 'front_page'
end
