class Post < ActiveRecord::Base
  validates :title, :presence   => true
  validates :user_id, :presence   => true

  belongs_to :forum
  belongs_to :user
end
