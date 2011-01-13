class Post < ActiveRecord::Base
  validates :title, :presence   => true
  validates :user_id, :presence   => true

  belongs_to :forum, :counter_cache => true
  belongs_to :user

  has_attached_file :file
end
