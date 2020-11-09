class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rooms'
  end

  def unsubscribed

  end
end
