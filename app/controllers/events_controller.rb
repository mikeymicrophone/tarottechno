class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def show
    @event = Event.find params[:id]
  end
  
  def create
    @event = Event.create event_params
    redirect_to @event
  end
  
  def event_params
    params.require(:event).permit(:name)
  end
end