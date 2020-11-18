class LobbyChannel < ApplicationCable::Channel
  def subscribed
    stream_from lobby
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def receive(data)
    # Some pile's card(s) will be contained in the data
    # Call database edits before broadcasting changes
    ActionCable.server.broadcast \
      lobby, format_response(data)
  end
  def lobby
    "room_#{params[:room]}"
  end

  def format_response data
    {
        message: data["pile"],
        username: current_user.user_id
    }
  end
end
