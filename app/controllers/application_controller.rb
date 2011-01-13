class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_is_admin
    if !(current_user && current_user.is_admin)
      redirect_to root_path
    end
  end
end
