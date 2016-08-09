class ReadersController < ApplicationController
  def index
    @readers = Reader.all
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
end
