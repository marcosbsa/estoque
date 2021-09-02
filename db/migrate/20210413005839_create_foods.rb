class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :titulo
      t.string :marca
      t.float :preco
      t.date :validade
      t.string :peso

      t.timestamps
    end
  end
end
