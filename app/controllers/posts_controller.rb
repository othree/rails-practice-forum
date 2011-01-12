class PostsController < ApplicationController
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
    @post.save

    redirect_to forum_post_path(@forum, @post)
  end
end
