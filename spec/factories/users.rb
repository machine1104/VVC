require 'faker'

FactoryBot.define do
    factory :user do |f|
      f.username { Faker::Internet.user_name(5..20)}
      f.email { Faker::Internet.email}
      f.password { Faker::Internet.password(8)}
      f.comune { Faker::Address.city}
      f.data_nascita { Faker::Date.birthday(18)}
    end
  end