class AddAttachmentAvatarToArmazems < ActiveRecord::Migration[4.2]
  def self.up
    change_table :armazems do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :armazems, :avatar
  end
end
