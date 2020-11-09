require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validate new users" do
    it "Should create a new account if provided valid info" do
      # Valid
      test_params = {user_id: "kev", password: "asdf123", password_confirmation: "asdf123",
                     email: "me@google.com", email_confirmation: "me@google.com"}
      @user = User.create!(test_params)
      expect(@user.valid?).to be_truthy
    end
    it "password must be 7-20 characters, have letter+number and a confirmation" do
      # Invalid
      test_params = {user_id: "kev", password: "12345", password_confirmation: "12345",
                     email: "me@google.com", email_confirmation: "me@google.com"}
      @user = User.new(test_params)
      expect(@user.valid?).to be_falsey

      test_params = {user_id: "kev", password: "asdf", password_confirmation: "asdf",
                     email: "me@google.com", email_confirmation: "me@google.com"}
      @user = User.new(test_params)
      expect(@user.valid?).to be_falsey

      test_params = {user_id: "kev", password: "12121212asas12121212aasdfasdf", password_confirmation: "12121212asas12121212a",
                     email: "me@google.com", email_confirmation: "me@google.com"}
      @user = User.new(test_params)
      expect(@user.valid?).to be_falsey
    end
    it "Email must have valid format" do
      # Invalid
      test_params = {user_id: "kev", password: "12345", password_confirmation: "asdf123",
                     email: "me@google.com", email_confirmation: "me@google.lol"}
      @user = User.new(test_params)
      expect(@user.valid?).to be_falsey
      test_params = {user_id: "kev", password: "12345", password_confirmation: "asdf123",
                     email: "me@google.com", email_confirmation: "me@;;a.edu"}
      @user = User.new(test_params)
      expect(@user.valid?).to be_falsey
      test_params = {user_id: "kev", password: "12345", password_confirmation: "asdf123",
                     email: "me@google.com", email_confirmation: "meyou.edu"}
      @user = User.new(test_params)
      expect(@user.valid?).to be_falsey
    end
    it "create! failures will rethrow error" do
      # Invalid
      test_params = {user_id: "kev", password: "12345", password_confirmation: "asdf123",
                     email: "me@google.com", email_confirmation: "me@google.lol"}

      begin
        User.create!(test_params)
      rescue => e
        expect(e.class).to be(ActiveRecord::RecordInvalid)
      end
    end
  end
end
