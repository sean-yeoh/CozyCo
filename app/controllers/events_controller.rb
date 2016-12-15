class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @attend = EventAttendee.where("event_id = ? AND user_id = ?", params[:id], current_user.id).take
    @event_attendees = @event.event_attendees.where(attending: true)
  end

  def edit
    @event = Event.find(params[:id])
    render 'edit'
  end

  def update
    @event = Event.find(params[:id])
     if @event.update!(event_params)
       redirect_to @event
     else
       render 'edit'
     end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def event_params
    params.require(:event).permit(:title, :body, :start_date, :end_date, :start_time, :location, :POC)
  end
end
