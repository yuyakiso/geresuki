FactoryBot.define do
  factory :gerende do
    name{Faker::Lorem.sentence}
    image{'https://rusutsu.com/wp-content/uploads/trail-map-winter.jpg'}
    association :prefecture
  end
end