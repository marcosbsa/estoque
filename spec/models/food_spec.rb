require 'rails_helper'

RSpec.describe Food, type: :model do
  it "is invalid if the preco is less than 0" do 
  # expect(Armazem.create(name: 'Leite', brand: 'Danone', weight: -1, description: 'Integral', price: -4)).to_not be_valid

  #com FactoryBot e FFaker: 
  food = build(:food, preco: FFaker::Random.rand(-99..-1))
  expect(food).to_not be_valid
end
  it "is valid if preco is the 0" do
  # expect(Armazem.create(name: 'Creme de Leite', brand: 'Nestle', weight: 400, description: 'Integral', price: 2)).to be_valid

  #com FactoryBot e FFaker: 
  food = build(:food, preco: FFaker::Random.rand(1..999))
  expect(food).to be_valid
end

  #com FFaker:
  it "is invalid if the preco are less than 0" do 
   titulo,marca,peso  = FFaker::Name.first_name
   preco = FFaker::Random.rand(-99..-1)
   food = Food.new(titulo: titulo, marca: marca, peso: peso, preco: preco)
   expect(food).to_not be_valid
end
end
