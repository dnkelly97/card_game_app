class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:id])
    print(room)
    stream_from room
  end

  def unsubscribed

  end
end
