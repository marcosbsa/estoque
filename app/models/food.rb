class Food < ApplicationRecord
    validates :titulo, :marca, :peso, :preco, presence: true
    validates :preco, numericality: { greater_than: 0}
end
