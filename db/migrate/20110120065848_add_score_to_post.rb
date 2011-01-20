class AddScoreToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :score, :integer, :default => 0
  end 

  def self.down
    remove_column :posts, :score
  end 
end
