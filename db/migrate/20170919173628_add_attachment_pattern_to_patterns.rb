class AddAttachmentPatternToPatterns < ActiveRecord::Migration[5.1]
  def self.up
    change_table :patterns do |t|
      t.attachment :pattern
    end
  end

  def self.down
    remove_attachment :patterns, :pattern
  end
end
	