class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
 
   @attended_events  = Event.past_events
   @upcoming_events  = Event.upcoming_events
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event
       @attendees = @event.attendees
    else
      render text: 'Welcome, no event available'
    end
  end

  def create
    current_user
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event.creator
    else
      redirect_to 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end
end
