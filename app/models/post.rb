# == Schema Information
#
# Table name: posts
#
#  id                :integer(4)      not null, primary key
#  title             :string(255)
#  content           :text
#  forum_id          :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#  user_id           :integer(4)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer(4)
#  file_updated_at   :datetime
#

class Post < ActiveRecord::Base
  belongs_to :forum, :counter_cache => true
  belongs_to :user

  has_attached_file :file

  validates :title, :presence   => true
  validates :content, :presence   => true
  validates :forum_id, :presence   => true
  #validates :user_id, :presence   => true

end
