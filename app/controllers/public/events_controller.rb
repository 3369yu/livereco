class Public::EventsController < ApplicationController
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new
    if @event.save
       flash[:notice] = "スケジュールを登録しました"
       redirect_to events_path
    else
       render :index
    end
  end
  
  def index
    @event = Event.all
  end
  
  def show
    @enent = Event.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  private
  def event_params
    params.require(:event).permit(:name, :event_data, :place, :open, :start, :title, :price, :buy, :imag, :seet, :transportation, :stay, :impression, :setlist, :is_active)
  end
  
end
