class QuerentsController < ApplicationController
  def index
    @querents = Querent.all
  end
  
  def revise
    @querent = current_querent
  end
  
  def redefine
    @querent = current_querent
    
    @querent.update querent_params
    
    redirect_to Event.last, :notice => "That IS good, #{@querent.name}!"
  end
  
  def querent_params
    params.require(:querent).permit(:first_name, :last_name, :moniker, :avatar, :phone)
  end
end
