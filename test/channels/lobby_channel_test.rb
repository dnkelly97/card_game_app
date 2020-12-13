require 'test_helper'
class LobbyChannelTest < ActionCable::Channel::TestCase
  def test_subscribed_with_room_number
    # Simulate a subscription creation
    subscribe room: 1

    # Asserts that the subscription was successfully created
    assert subscription.confirmed?

    # Asserts that the channel subscribes connection to a stream
    assert_has_stream "room_1"

  end

  def test_does_not_stream_with_incorrect_room_number
    subscribe room_number: "lol"

    # Asserts that not streams was started
    assert_no_streams

    subscribe room: -1

    # Asserts that not streams was started
    assert_no_streams
  end

  def test_does_not_subscribe_without_room_number
    subscribe

    # Asserts that the subscription was rejected
    assert subscription.rejected?
  end

end