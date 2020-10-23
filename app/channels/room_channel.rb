class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find params[:room]
    stream_for room
    reject unless current_user.can_access?(@room)
    # stream_from "room_#{params[:room]}"
  end
  def unsubscribed
    room = Room.find params[:room]
    stop_stream_for room
  end
end