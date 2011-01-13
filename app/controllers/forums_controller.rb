class ForumsController < ApplicationController
  include AuthenticatedSystem

  def index
    @user = current_user
    @forums = Forum.all
  end
  def show
    @forum = Forum.find(params[:id])
    @posts = @forum.posts.paginate(:page => params[:page], :per_page => 3)
  end
end
