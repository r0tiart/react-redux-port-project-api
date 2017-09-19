class AddAttachmentAvatarToWorks < ActiveRecord::Migration[5.1]
  def self.up
    change_table :works do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :works, :avatar
  end
end
