class AddVoteCountToWorks < ActiveRecord::Migration[5.1]
  def change
  	add_column :works, :vote_count, :integer, :default => 0
  end
end
