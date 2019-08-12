class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
  end

  def show
  end

  def create
    current_user
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to current_user
    else
      redirect_to 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end
end
