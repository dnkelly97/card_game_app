require 'test_helper'

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "rejects connection without params" do
    # Use `assert_reject_connection` matcher to verify that
    # connection is rejected
    assert_reject_connection { connect }
  end


  test "connects with cookies" do
    User.delete_all
    @user = FactoryBot.create(:user)
    cookies.encrypted[:user_id] = @user.id.to_s

    connect

    assert_equal connection.current_user.id.to_s, @user.id.to_s
  end
end