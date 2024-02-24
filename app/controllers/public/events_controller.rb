class Public::EventsController < ApplicationController
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new
  end
  
  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  private
  def event_params
    params.require(:event).permit(:name, :event_data, :place, :open, :start, :title, :price, :buy, :imag, :seet, :transportation, :stay, :impression, :setlist, :is_active)
  end
  
end
