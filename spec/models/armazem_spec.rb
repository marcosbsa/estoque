require 'rails_helper'

RSpec.describe Armazem, type: :model do
  it "is invalid if the price and weight are less than 0" do 
  # expect(Armazem.create(name: 'Leite', brand: 'Danone', weight: -1, description: 'Integral', price: -4)).to_not be_valid

  #com FactoryBot e FFaker: 
  armazem = build(:armazem, price: FFaker::Random.rand(-99..-1), weight: FFaker::Random.rand(-99..-1))
  expect(armazem).to_not be_valid
end
  it "is valid if price and weight are more the 0" do
  # expect(Armazem.create(name: 'Creme de Leite', brand: 'Nestle', weight: 400, description: 'Integral', price: 2)).to be_valid

  #com FactoryBot e FFaker: 
  armazem = build(:armazem, price: FFaker::Random.rand(1..999), weight: FFaker::Random.rand(1..999))
  expect(armazem).to be_valid
end

  #com FFaker:
  it "is invalid if the price and weight are less than 0" do 
   name,brand,description = FFaker::Name.first_name
   weight,price = FFaker::Random.rand(-99..-1)
   armazem = Armazem.new(name: name, brand: brand, weight: weight, description: description, price: price)
   expect(armazem).to_not be_valid
end

context "validation tests" do
  it "ensures name, brand, weight, price, description and avatar are presences" do
    armazem = build(:armazem, price: FFaker::Random.rand(1..999), weight: FFaker::Random.rand(1..999), 
    description: FFaker::Name.first_name, name: FFaker::Name.first_name, brand: FFaker::Name.first_name)
    Rack::Test::UploadedFile.new('spec/fixtures/files/download.jpeg', 'image/jpeg')
    expect(armazem).to be_valid
  end
 end
end
