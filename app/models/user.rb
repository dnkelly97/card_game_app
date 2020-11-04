# frozen_string_literal: true
class User < ActiveRecord::Base

  # Confirmation: You should use this helper when you have two text fields that should receive exactly the same content
  # So use this in the view
  # <%= text_field :person, :email %>
  # <%= text_field :person, :email_confirmation %>

  has_secure_password
  validates :email, confirmation: true, uniqueness: true, unless: -> { email.blank? }
  validates :user_id, presence: true, uniqueness: true
  validate :password_checker, on: :create
  validate :email_checker, on: :create

  def self.create!(user_params)
    user_params.merge!({ session_token: SecureRandom.base64 })
    begin
      super(user_params)
    rescue ActiveRecord::RecordInvalid => e
      nil
      raise e
    end
  end

  def password_checker
    password_check = /([a-zA-Z]|\d){7,20}/.match?(password) &&
                     /\A.*\d.*\z/.match?(password) &&
                     /\A.*[a-zA-Z].*\z/.match?(password)
    errors.add(:password, 'Password must contain 7-20 characters with only digits or letters') unless password_check
  end

  def email_checker
    email_check = /\w+@\w+\.(com|edu|net|gov)/.match?(email)
    errors.add(:email, 'Must be a valid email address') unless email_check
  end

end
