class ForumsController < ApplicationController
  include AuthenticatedSystem

  def index
    @user = current_user
    @forums = Forum.all
  end
  def show
    @forum = Forum.find(params[:id])
  end
end
