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
    if params[:name]
      @name = params[:name]
      @event = Event.where(['name LIKE ?', "%#{@name}%"])
    else
      @event = Event.all
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    is_matching_login_user
    @event = Event.find(params[:id])
  end

  def update
    is_matching_login_user
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "編集しました"
      redirect_to @event
    else
      render :edit
    end
  end
  
  def destroy
    is_matching_login_user
    event = Event.find(params[:id])
    if event.destroy
     flash[:notice] = "削除しました"
      redirect_to events_path
    else
      render :edit
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :event_data, :place, :open, :start, :title, :price, :buy, :image, :seet, :transportation, :stay, :impression, :setlist, :status)
  end
  
  def is_matching_login_user
    event = Event.find(params[:id])
    user = event.user
    unless user.id == current_user.id
      redirect_to events_path
    end
  end

end
