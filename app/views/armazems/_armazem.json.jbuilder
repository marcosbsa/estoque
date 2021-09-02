json.extract! armazem, :id, :name, :brand, :weight, :price, :description, :expiration, :created_at, :updated_at
json.url armazem_url(armazem, format: :json)
