class ForumsController < ApplicationController
  include AuthenticatedSystem

  def index
    @forums = Forum.all
  end
  def show
    @forum = Forum.find(params[:id])
    @posts = @forum.posts.paginate(:page => params[:page], :per_page => 20, :order => 'id DESC')
  end
end
