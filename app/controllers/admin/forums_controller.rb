class Admin::ForumsController < Admin::BaseController
  include AuthenticatedSystem
  before_filter :require_is_admin

  def index
    @forums = Forum.all
  end
  def show
    @forum = Forum.find(params[:id])
    @posts = @forum.posts.paginate(:page => params[:page], :per_page => 3)
  end
end
