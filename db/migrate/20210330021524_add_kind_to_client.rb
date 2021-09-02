class AddKindToClient < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :kind, :string
  end
end
