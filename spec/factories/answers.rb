FactoryBot.define do
  factory :answer do
    contenuto { "MyText" }
    user { nil }
    announcement { nil }
    question { nil }
  end
end
