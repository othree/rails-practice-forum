class PostsController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required, :except => [:show, :index]
  before_filter :find_forum, :only => [:index]

  def index
    @posts = @forum.posts.paginate(:page => params[:page], :per_page => 20, :order => 'id DESC')
  end

  def show
    @forum = Forum.find(params[:forum_id])
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @forum = Forum.find(params[:forum_id])
    @post = @forum.posts.new(params[:post])
    @post.user_id = current_user.id
    @post.save

    redirect_to forum_post_path(@forum, @post)
  end
  def edit
    @post = current_user.posts.find(params[:id])
  end
  def update
    @post = current_user.posts.find(params[:id])
    @post.update_attributes(params[:post])
    
    redirect_to forum_post_path(@post.forum_id, @post)
  end
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    
    redirect_to forum_path(params[:forum_id])
  end

  protected
  def find_forum
    @forum = Forum.find(params[:forum_id])
  end
end
