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
    @event = Event.where(user_id: current_user.id).includes(:user).order(event_data: "DESC")
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    ensure_correct_user
    @event = Event.find(params[:id])
  end

  def update
    ensure_correct_user
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "編集しました"
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    ensure_correct_user
    event = Event.find(params[:id])
    if event.destroy
     flash[:notice] = "削除しました"
      redirect_to events_path
    else
      render :edit
    end
  end

  def history
    events = Event.all
      events.each do |event|
    return if event.status == "open" && event.user_id != current_user.id
      @event = Event.where(status_i18n: "公開")
    if params[:name]
      @name = params[:name]
      @event = Event.where(['name LIKE ?', "%#{@name}%"])
    else
      @event = Event.where(user_id: current_user.id).includes(:user)
    end
  end
  end

  private
  def event_params
    params.require(:event).permit(:name, :event_data, :place, :open, :start, :title, :price, :buy, :image, :seet, :transportation, :stay, :impression, :setlist, :status)
  end

  def ensure_correct_user
    event = Event.find(params[:id])
    if event.user.id == current_user.id
      redirect_to events_path
    end
  end

  def event_status
    event = Event.find(params[:id])
    if event.status_i18n == "非公開"
      redirect_to events_path
    end
  end

end
