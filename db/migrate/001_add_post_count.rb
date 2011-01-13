class AddPostCount < ActiveRecord::Migration
  def self.up
    add_column :forums, :posts_count, :integer, :default => 0
    Forum.reset_column_information
    Forum.find(:all).each do |f|
      Forum.update_counters f.id, :posts_count => f.posts.length
    end
  end

  def self.down
    remove_column :forums, :posts_count
  end
end
