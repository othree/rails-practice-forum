class ForumsController < ApplicationController
  include AuthenticatedSystem

  def index
    @forums = Forum.all
  end
  def show
    @forum = Forum.find(params[:id])
    @posts = @forum.posts.paginate(:page => params[:page], :per_page => 20, :order => 'id DESC')
  end
  def new
    @forum = Forum.new
  end
  def create
    @forum = Forum.new(params[:forum])
    if @forum.save
      redirect_to forum_path(@forum)
    else
      render :new
    end
  end
end
