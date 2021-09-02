FactoryBot.define do
  factory :food do
    titulo {FFaker::Lorem.word}
    marca {FFaker::Lorem.word}
    preco {FFaker::Random.rand(1..999)}
    peso {FFaker::Lorem.word}
  end
end
