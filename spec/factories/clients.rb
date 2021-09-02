FactoryBot.define do
    factory :client do
      name { FFaker::Lorem.word }
      gender { 'Male' }
      kind { 'Varejista' }
      address { FFaker::Lorem.word }
      email { FFaker::Internet.email }
      cpf { FFaker::Random.rand(1.0..99999999999.0) }
      rg { FFaker::Random.rand(1.0..99999999999.0) }
      phone { FFaker::Random.rand(1.0..99999999999.0) }
      birth {DateTime.new(2016,10,22,0,0,0)}
      cnpj { FFaker::Random.rand(1.0..99999999999.0) }
    end
  end