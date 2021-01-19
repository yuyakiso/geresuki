FactoryBot.define do
  factory :prefecture do
    name{Faker::Lorem.sentence}
    id  {Faker::Number.between(from: 1, to: 47)}
  end
end