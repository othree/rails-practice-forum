class Admin::PostsController < Admin::BaseController
  include AuthenticatedSystem
  before_filter :require_is_admin
  before_filter :find_post, :only => [ :show, :edit, :update, :destroy ]

  def show
  end
  def edit
  end
  def update
    @post.update_attributes(params[:post])
    
    redirect_to admin_forum_post_path(@post.forum_id, @post)
  end
  def destroy
    @post.destroy
    
    redirect_to admin_forum_path(params[:forum_id])
  end

  protected

  def find_post
    @forum = Forum.find(params[:forum_id])
    @post = @forum.posts.find(params[:id])
  end
end
