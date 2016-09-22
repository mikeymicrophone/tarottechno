class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def line_shift
    @event = Event.find params[:id]
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
    params.require(:event).permit(:name, :start_time, :end_time, :location, :facebook_url)
  end
end
