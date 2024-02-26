class Public::EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
       flash[:notice] = "スケジュールを登録しました"
       redirect_to event_path(@event.id)
    else
       render :index
    end
  end

  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
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
