class ReadersController < ApplicationController
  def index
    @readers = Reader.all
  end
  
  def revise
    @reader = current_reader
  end
  
  def redefine
    @reader = Reader.find(current_reader.id)
    
    @reader.moniker = reader_params[:moniker]
    @reader.avatar = reader_params[:avatar]
    @reader.phone = reader_params[:phone]
    @reader.save
    
    redirect_to Event.last, :notice => "That IS good, #{@reader.name}!"
  end
  
  def edit
    @reader = current_reader
  end
  
  def update
    @reader = current_reader
    @reader.moniker = params[:reader][:moniker]
    @reader.save
    redirect_to readers_path
  end
  
  def new
    @reader = Reader.new
  end
  
  def name
    @reader = Reader.create reader_params
    redirect_to readers_path
  end
  
  def activate
    @reader = Reader.find params[:id]
    @reader.update_attribute :active, true
    redirect_to :action => :index
  end
  
  def deactivate
    @reader = Reader.find params[:id]
    @reader.update_attribute :active, false
    redirect_to :action => :index
  end
  
  private
  
  def reader_params
    params.require(:reader).permit(:moniker, :avatar, :phone)
  end
end
