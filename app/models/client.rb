class Client < ApplicationRecord
    validates :name, :gender, :kind, :address, :email, :cpf, :rg, :phone, :cnpj, :birth, presence: true
    validates :cpf, :rg, :phone, :cnpj, numericality: { greater_than: 0}
end
