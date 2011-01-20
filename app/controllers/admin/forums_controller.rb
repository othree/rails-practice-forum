class Admin::ForumsController < Admin::BaseController
  include AuthenticatedSystem
  before_filter :require_is_admin

  def index
    @forums = Forum.all
  end
  def show
    @forum = Forum.find(params[:id])
    redirect_to admin_forum_posts_path(@forum)
  end
  def new
    @forum = Forum.new
  end
  def create
    @forum = Forum.new(params[:forum])
    if @forum.save
      redirect_to admin_forum_posts_path(@forum)
    else
      render :new
    end
  end
end
