module ApplicationHelper
  def user_status(user)
    out = ''
    if user
      out << user.login + ", " + link_to("logout", logout_path)
    else
      out << link_to("login",  login_path)
    end
    out.html_safe
  end
end
