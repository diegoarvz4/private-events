class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def create
    current_user
    @event = current_user.created_events.build(event_params)
    if @event.save
      render 'show'
    else
      redirect_to 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end
end
