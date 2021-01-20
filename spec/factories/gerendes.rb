FactoryBot.define do
  factory :gerende do
    name{Faker::Lorem.sentence}
    image{'https://rusutsu.com/wp-content/uploads/trail-map-winter.jpg'}
    association :prefecture
    id  {Faker::Number.between(from: 1, to: 446)}
  end
end