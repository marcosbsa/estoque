require 'rails_helper'

RSpec.describe Account, type: :model do
  it "is valid if email is correct" do 
    account = build(:account, email: FFaker::Internet.email)
    expect(account).to be_valid
end
 
  it "is valid if password is correct" do 
  expect(Account.create(first_name: FFaker::Lorem.word, last_name: FFaker::Lorem.word, 
  email: FFaker::Internet.email,password: "1234567", password_confirmation: "1234567")).to be_valid
end

  it "is invalid if password is incorrect" do 
    expect(Account.create(first_name: FFaker::Lorem.word, last_name: FFaker::Lorem.word, 
      email: FFaker::Internet.email, password: "1832", password_confirmation: "1832")).to_not be_valid 
end

  it "is invalid if password is incorrect" do 
    expect(Account.create(first_name: FFaker::Lorem.word, last_name: FFaker::Lorem.word, 
      email: FFaker::Internet.email, password: "1832", password_confirmation: "")).to_not be_valid
end

  it "is invalid if password is incorrect" do 
    expect(Account.create(first_name: FFaker::Lorem.word, last_name: FFaker::Lorem.word, 
      email: FFaker::Internet.email, password: "1234567", password_confirmation: "")).to_not be_valid   
end

  it "is invalid if password is incorrect" do 
    expect(Account.create(first_name: FFaker::Lorem.word, last_name: FFaker::Lorem.word, 
      email: FFaker::Internet.email, password: "", password_confirmation: "1234567")).to_not be_valid
end 

  it "is invalid if password is incorrect" do 
    expect(Account.create(first_name: FFaker::Lorem.word, last_name: FFaker::Lorem.word, 
      email: FFaker::Internet.email, password: "1234567", password_confirmation: "18324789")).to_not be_valid
end
end
