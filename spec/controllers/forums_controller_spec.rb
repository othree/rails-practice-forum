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

      Forum.should_receive(:find).once.with(2).and_return(@forum)
      controller.send(:find_forum)

      assigns(:forum).should eq(@forum)
    end
  end

  describe "GET index" do
    it "returns all forums" do
      @forums = [ mock_model(Forum) ]
      Forum.stub(:all) { @forums }

      get :index, :id => 2

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

  #pending "GET edit"

  #pending "PUT update"

  #pending "DELETE destroy"
end
