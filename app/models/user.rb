# frozen_string_literal: true
class User < ActiveRecord::Base
  belongs_to :room
  # Confirmation: You should use this helper when you have two text fields that should receive exactly the same content
  # So use this in the view
  # <%= text_field :person, :email %>
  # <%= text_field :person, :email_confirmation %>

  has_secure_password
  before_save { |user| user.email = user.email.downcase }
  before_create :create_session_token
  validates :email, presence: true, confirmation: true, uniqueness: true, format: { with: /\A\w+@\w+\.[a-z]{2,}\z/i, on: :create }
  validates :user_id, presence: true, uniqueness: true, on: create, length: { maximum: 30 }
  validates :password_confirmation, :email_confirmation, presence: true, on: :create
  validate :password_checker, on: :create


private
  def create_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end

  def password_checker
    password_check = /([a-zA-Z]|\d){7,20}/.match?(password) &&
                     /\A.*\d.*\z/.match?(password) &&
                     /\A.*[a-zA-Z].*\z/.match?(password)
    errors.add(:password, 'Password must contain 7-20 characters with only digits and letters') unless password_check
  end


end
