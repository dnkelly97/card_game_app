FactoryBot.define do
  factory :user do
    email { 'me@you.com' }
    email_confirmation { 'me@you.com' }
    password { 'testpass1' }
    password_confirmation { 'testpass1' }
    user_id { 'kevin' }
  end
end
