class LobbyUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # Will send a payload of which piles have been updated. If the user current has one of the piles
    # "opened", then the JS will trigger an update on the AJAX elements.
    ActionCable.server.broadcast("room_#{args[0].to_s}", pile: args[1])
  end
end
