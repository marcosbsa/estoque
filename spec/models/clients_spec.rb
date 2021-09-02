require 'rails_helper'

RSpec.describe Client, type: :model do
  it "is invalid if the cpf,rg,phone,cnpj are less than 0" do 
  # expect(Armazem.create(name: 'Leite', brand: 'Danone', weight: -1, description: 'Integral', price: -4)).to_not be_valid

  #com FactoryBot e FFaker: 
  client = build(:client, cpf: FFaker::Random.rand(-99..-1))
  client = build(:client, rg: FFaker::Random.rand(-99..-1))
  client = build(:client, phone: FFaker::Random.rand(-99..-1))
  client = build(:client, cnpj: FFaker::Random.rand(-99..-1))
  expect(client).to_not be_valid
end
  it "is valid if cpf,rg,phone,cnpj are the 0" do
  # expect(Armazem.create(name: 'Creme de Leite', brand: 'Nestle', weight: 400, description: 'Integral', price: 2)).to be_valid

  #com FactoryBot e FFaker: 
  client = build(:client, cpf: FFaker::Random.rand(1..99999999999))
  client = build(:client, rg: FFaker::Random.rand(1..99999999999))
  client = build(:client, phone: FFaker::Random.rand(1..99999999999))
  client = build(:client, cnpj: FFaker::Random.rand(1..99999999999))
  expect(client).to be_valid
end

  #com FFaker:
  it "is invalid if the preco and peso are less than 0" do 
   name,address = FFaker::Lorem.word
   email = FFaker::Internet.email
   cpf,rg,phone,cnpj = FFaker::Random.rand(-99..-1)
   client = Client.new(name: name, address: address, email: email, cpf: cpf, rg: rg, phone: phone, cnpj: cnpj)
   expect(client).to_not be_valid
end
end