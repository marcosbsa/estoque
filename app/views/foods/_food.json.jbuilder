json.extract! food, :id, :titulo, :marca, :preco, :validade, :peso, :created_at, :updated_at
json.url food_url(food, format: :json)
