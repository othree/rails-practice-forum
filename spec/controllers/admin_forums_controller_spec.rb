require 'spec_helper'

describe Admin::ForumsController do

  def login_as_admin
    @current_user = mock_model(User, :is_admin => true) 
    controller.stub!(:current_user).and_return(@current_user)
    controller.stub!(:login_required).and_return(:true)
  end
  def login_as_user
    @current_user = mock_model(User, :is_admin => false) 
    controller.stub!(:current_user).and_return(@current_user)
    controller.stub!(:login_required).and_return(:true)
  end

  describe "GET index" do
    it "returns all forums" do
      login_as_admin
      @forums = [ mock_model(Forum) ]
      Forum.stub(:all) { @forums }

      get :index

      assigns(:forums).should eq( @forums )
      response.should render_template("index")
    end
    it "not admin will redirect to root/" do
      login_as_user
      get :index
      response.should redirect_to(root_path)
    end
  end
  describe "GET show" do
    it "redirect to forum_forums" do
      login_as_admin
      #@forums = [ mock_model(Forum) ]
      @forum = mock_model(Forum)
      Forum.should_receive(:find).once.with(2).and_return(@forum)

      get :show, :id => 2
      response.should redirect_to(admin_forum_posts_path(@forum))
    end
    it "not admin will redirect to root/" do
      login_as_user
      get :show, :id => 2
      response.should redirect_to(root_path)
    end
  end
  describe "GET new" do
    it "returns a new forum form" do
      login_as_admin
      @forum = mock_model(Forum)
      Forum.should_receive(:new).and_return(@forum)

      get :new

      assigns(:forum).should eq(@forum)
      response.should render_template("new")
    end
  end

  describe "POST create" do
    it "creates successfully" do
      login_as_admin
      @forum = mock_model(Forum)
      @params = { "title" => Faker::Lorem.sentence }
      Forum.should_receive(:new).with(@params).and_return(@forum)
      @forum.should_receive(:save).and_return(true)

      post :create, {:forum => @params}

      response.should redirect_to(admin_forum_posts_path(@forum))
    end

    it "fails to create" do
      login_as_admin
      @forum = mock_model(Forum)
      @params = { "title" => Faker::Lorem.sentence }
      Forum.should_receive(:new).with(@params).and_return(@forum)
      @forum.should_receive(:save).and_return(false)

      post :create, {:forum => @params}

      assigns(:forum).should eq(@forum)
      response.should render_template("new")
    end
  end

  #pending "GET edit"

  #pending "PUT update"

  #pending "DELETE destroy"
end
