class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
    events_separated = Event.events_dates(@events)
    @upcoming_events = events_separated[0]
    @attended_events = events_separated[1]
  end

  def show
    @event = Event.find_by(id: params[:id])
    @attendees = @event.attendees
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
