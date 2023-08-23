FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    client
  end
end
