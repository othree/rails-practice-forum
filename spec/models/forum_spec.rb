require 'spec_helper'

describe Forum do
  before(:each) do
    @params = {:name => Faker::Lorem.sentence}
  end

  it "is valid with params" do
    Forum.new(@params).should be_valid
  end
  it "is invalid without title" do
    @params = {}
    Forum.new(@params.except(:title)).should_not be_valid
  end

end

