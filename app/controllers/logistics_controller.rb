class LogisticsController < ApplicationController
  skip_before_action :authenticate_reader!
end
