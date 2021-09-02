class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :email
      t.float :cpf
      t.float :rg
      t.float :phone
      t.date :birth
      t.float :cnpj

      t.timestamps
    end
  end
end
