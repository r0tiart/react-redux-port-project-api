class CreatePatterns < ActiveRecord::Migration[5.1]
  def change
    create_table :patterns do |t|
      t.integer :work_id
      t.boolean :show_attribute, :default => false
      
      t.timestamps
    end
  end
end
