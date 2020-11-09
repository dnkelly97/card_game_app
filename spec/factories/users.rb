FactoryGirl.define do
  factory :user do
    id { 1 }
    email { 'you@me.com' }
    password { '' }
  end
end
