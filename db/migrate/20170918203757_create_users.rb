class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :username
      t.text :password_digest 
      t.text :email
      

      t.timestamps
    end
  end
end
