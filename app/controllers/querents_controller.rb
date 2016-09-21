class QuerentsController < ApplicationController
  def index
    @querents = Querent.all
  end
  
  def revise
    @querent = current_querent
  end
  
  def redefine
    @querent = current_querent
    
    @querent.moniker = querent_params[:moniker]
    @querent.avatar = querent_params[:avatar]
    @querent.phone = querent_params[:phone]
    @querent.save
    
    redirect_to Event.last, :notice => "That IS good, #{@querent.name}!"
  end
  
  def approve_avatar
    @querent = Querent.find params[:id]
    @querent.avatar_approved = true
    @querent.save
    redirect_to :action => :index
  end
  
  def querent_params
    params.require(:querent).permit(:first_name, :last_name, :moniker, :avatar, :phone)
  end
end
