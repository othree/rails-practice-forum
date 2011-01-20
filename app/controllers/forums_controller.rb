class ForumsController < ApplicationController
  include AuthenticatedSystem
  before_filter :find_forum, :only => [:show]

  def index
    @forums = Forum.all
  end
  def show
    redirect_to forum_posts_path(@forum)
    #@posts = @forum.posts.paginate(:page => params[:page], :per_page => 20, :order => 'id DESC')
  end
   
  protected

  def find_forum
    @forum = Forum.find(params[:id])
  end
end
