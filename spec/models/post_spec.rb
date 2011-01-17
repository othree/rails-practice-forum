require 'spec_helper'

describe Post do
  before(:each) do
    @params = {
      :title       => Faker::Lorem.sentence,
      :content     => Faker::Lorem.sentence,
      :forum_id    => 1
    }
  end

  it "is valid with params" do
    Post.new(@params).should be_valid
  end

  it "is invalid without title" do
    Post.new(@params.except(:title)).should_not be_valid
  end

  it "is invalid without description" do
    Post.new(@params.except(:content)).should_not be_valid
  end

  it "is invalid without forum_id" do
    Post.new(@params.except(:forum_id)).should_not be_valid
  end
end
