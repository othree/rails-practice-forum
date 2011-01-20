class PostsController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required, :except => [:show, :index, :plus]
  before_filter :find_forum
  before_filter :find_post, :except => [:index, :new, :create]

  def index
    @posts = @forum.posts.paginate(:page => params[:page], :per_page => 20, :order => 'id DESC')
  end

  def show
  end
  def new
    @post = @forum.posts.new
  end
  def create
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
    if @post.update_attributes(params[:post])
      redirect_to forum_post_path(@post.forum_id, @post)
    else
      render :edit
    end
  end
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    
    redirect_to forum_posts_path(params[:forum_id])
  end
  def plus
    @post.score = @post.score + 1
    @post.save

    respond_to do |format|
      format.any { render :json => {
        :forum_id => @post.forum_id,
        :post_id => @post.id,
        :score => @post.score
      } }
    end
  end

  protected
  def find_forum
    @forum = Forum.find(params[:forum_id])
  end
  def find_post
    @post = @forum.posts.find(params[:id])
  end
end
