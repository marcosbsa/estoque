class Armazem < ApplicationRecord
    validates :name, :brand, :weight, :description, :expiration, :price, presence: true
    validates :weight, :price, numericality: { greater_than: 0}

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  
end
