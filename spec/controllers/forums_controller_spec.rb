require 'spec_helper'

describe ForumsController do

  def should_find_forum
    @forum = mock_model(Forum)
    controller.should_receive(:find_forum) { controller.instance_variable_set("@forum", @forum) }
  end

  describe "before_filter" do
    it "find_forum returns requested forum" do
      @forum = mock_model(Forum)
      controller.params = {:id => 2}

      Forum.should_receive(:find).with(2).and_return(@forum)
      controller.send(:find_forum)

      assigns(:forum).should eq(@forum)
    end
  end

  describe "GET index" do
    it "returns all forums" do
      @forums = [ mock_model(Forum) ]
      Forum.stub(:all) { @forums }

      get :index

      assigns(:forums).should eq( @forums )
      response.should render_template("index")
    end
  end
  describe "GET show" do
    it "redirect to forum_forums" do
      should_find_forum

      get :show, :id => 2

      response.should redirect_to(forum_posts_path(@forum))
    end
  end
  describe "GET new" do
    it "returns a new forum form" do
      @forum = mock_model(Forum)
      Forum.should_receive(:new).and_return(@forum)

      get :new

      assigns(:forum).should eq(@forum)
      response.should render_template("new")
    end
  end

  describe "POST create" do
    it "creates successfully" do
      @forum = mock_model(Forum)
      @params = { "title" => Faker::Lorem.sentence }
      Forum.should_receive(:new).with(@params).and_return(@forum)
      @forum.should_receive(:save).and_return(true)

      post :create, {:forum => @params}

      response.should redirect_to(forum_posts_path(@forum))
    end

    it "fails to create" do
      @forum = mock_model(Forum)
      @params = { "title" => Faker::Lorem.sentence }
      Forum.should_receive(:new).with(@params).and_return(@forum)
      @forum.should_receive(:save).and_return(false)

      post :create, {:forum => @params}

      assigns(:forum).should eq(@forum)
      response.should render_template("new")
    end
  end

  pending "GET edit"

  pending "PUT update"

  pending "DELETE destroy"
end
