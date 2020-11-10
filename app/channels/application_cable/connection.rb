module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # indentified_by :uuid
    def connect
      # TODO: Add user verification
      # self.uuid = SecureRandom.urlsafe_base64
    end
  end
end
