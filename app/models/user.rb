# frozen_string_literal: true
class User < ActiveRecord::Base

  # Confirmation: You should use this helper when you have two text fields that should receive exactly the same content
  # So use this in the view
  # <%= text_field :person, :email %>
  # <%= text_field :person, :email_confirmation %>
  validates :password, confirmation: true, unless: -> { password.blank? }
  validates :email, confirmation: true, unless: -> { email.blank? }
  validates :email_confirmation, :user_id, :password_confirmation, presence: true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name'] || '' if auth['info']
    end
  end
end
