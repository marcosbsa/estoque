FactoryBot.define do
    factory :account do 
      first_name { FFaker::Lorem.word }
      last_name { FFaker::Lorem.word }
      email { FFaker::Internet.email }
      password { "1234567" }
      password_confirmation { "1234567" }
    end
  end