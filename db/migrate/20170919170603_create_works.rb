class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :title
      t.string :description
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
