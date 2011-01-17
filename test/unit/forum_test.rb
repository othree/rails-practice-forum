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

require 'test_helper'

class ForumTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
