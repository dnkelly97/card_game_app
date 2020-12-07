require 'test_helper'

class LobbyUpdateJobTest < ActiveJob::TestCase
  include ActionCable::TestHelper

  test "broadcast message to room" do
    room = "room_1"

    assert_broadcast_on(LobbyChannel.broadcasting_for(room), pile: 1) do
      LobbyUpdateJob.perform_now(1, 1)
    end
  end
end
