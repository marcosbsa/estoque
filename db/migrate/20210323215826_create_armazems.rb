class CreateArmazems < ActiveRecord::Migration[6.1]
  def change
    create_table :armazems do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.float :weight, null: false
      t.float :price, null: false
      t.text :description, null: false
      t.date :expiration, null: false
      t.attachment :avatar, null: false

      t.timestamps
    end
  end
end
