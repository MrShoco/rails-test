FactoryGirl.define do
  factory :social_profile do
    email { Faker::Internet.email }
    name { Faker::Name.name }

    uid { Faker::Number.number(10) }
    provider { [:vkontakte, :facebook].sample }
  end
end
