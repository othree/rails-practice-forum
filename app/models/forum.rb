# == Schema Information
#
# Table name: forums
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  posts_count :integer(4)      default(0)
#

class Forum < ActiveRecord::Base
  has_many :posts, :autosave => true, :dependent => :destroy

  validates :name, :presence   => true
end
