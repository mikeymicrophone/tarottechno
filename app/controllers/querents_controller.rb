class QuerentsController < ApplicationController
  def index
    @querents = Querent.all
  end
end
