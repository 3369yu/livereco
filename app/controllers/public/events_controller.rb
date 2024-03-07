class Public::EventsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

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
    @events = Event.where(user_id: current_user.id).includes(:user).order(event_data: "DESC")
  end

  def show
    @event = Event.find(params[:id])
    unless @event.user.id == current_user.id && @event.status_i18n == "非公開"
      redirect_to events_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "編集しました"
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event.destroy
     flash[:notice] = "削除しました"
      redirect_to events_path
    else
      render :edit
    end
  end

  def history

      #return if event.status == "open" && event.user_id != current_user.id
    #@event = Event.where(status_i18n: "公開")
    if params[:name].present?
      @name = params[:name]
      @events = Event.where(['name LIKE ?', "%#{@name}%"]).order(event_data: "DESC")
    elsif params[:start_data].present? || params[:end_data].present?
      @start_data = Date.parse(params[:start_data])
      @end_data = Date.parse(params[:end_data])
      @events = Event.where(event_data: @start_data..@end_data).where(status: 'opened')
    else
      @events = current_user.events.order(event_data: "DESC")
      #Event.where(user_id: current_user.id)
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :event_data, :place, :open, :start, :title, :price, :buy, :image, :seet, :transportation, :stay, :impression, :setlist, :status)
  end

  def ensure_correct_user
    event = Event.find(params[:id])
    unless event.user.id == current_user.id
      redirect_to events_path
    end
  end

  def event_status
    event = Event.find(params[:id])
    unless event.status_i18n == "非公開"
      redirect_to events_path
    end
  end

end
