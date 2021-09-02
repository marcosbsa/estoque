class AddAvatarToArmazem < ActiveRecord::Migration[6.1]

  add_attachment :armazems, :avatar
  
  def change
  end
end
