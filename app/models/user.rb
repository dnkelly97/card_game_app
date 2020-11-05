# frozen_string_literal: true
class User < ActiveRecord::Base

  # Confirmation: You should use this helper when you have two text fields that should receive exactly the same content
  # So use this in the view
  # <%= text_field :person, :email %>
  # <%= text_field :person, :email_confirmation %>

  has_secure_password
  validates :email, presence: true, confirmation: true, uniqueness: true, format: { with: /\A\w+@\w+\.[a-z]{2,}\z/i, on: :create }
  validates :user_id, presence: true, uniqueness: true
  validates :password, :password_confirmation, :email_confirmation, presence: true
  validate :password_checker, on: :create

  def self.create!(user_params)
    user_params.merge!({ session_token: SecureRandom.base64 })
    begin
      super(user_params)
    rescue ActiveRecord::RecordInvalid => e
      raise e
    end
  end

  def password_checker
    password_check = /([a-zA-Z]|\d){7,20}/.match?(password) &&
                     /\A.*\d.*\z/.match?(password) &&
                     /\A.*[a-zA-Z].*\z/.match?(password)
    errors.add(:password, 'Password must contain 7-20 characters with only digits or letters') unless password_check
  end


end
