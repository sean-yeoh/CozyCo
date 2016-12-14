class EventAttendeesController < ApplicationController
  def attend
    @attend = EventAttendee.where("event_id = ? AND user_id = ?", params[:id], current_user.id).take
    if @attend.nil?
      @create_new = EventAttendee.create(event_id: params[:id], user_id: current_user.id, attending: true)
    elsif @attend.attending
      @attend.update(attending: false)
    else
      @attend.update(attending: true)
    end
    redirect_to event_path(params[:id])
  end
end
