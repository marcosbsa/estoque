FactoryBot.define do
  factory :armazem do
    name {FFaker::Lorem.word}
    brand {FFaker::Lorem.word}
    weight {FFaker::Random.rand(1..999)}
    price {FFaker::Random.rand(1..999)}
    description {FFaker::Lorem.word}
    expiration {DateTime.new(2016,10,22,0,0,0)}
  end
end