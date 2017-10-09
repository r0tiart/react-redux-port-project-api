class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :work_id
      t.integer :user_id
      t.timestamps
    end
  end
end
