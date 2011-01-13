module ApplicationHelper
  def user_status
    out = ''
    if current_user
      out << current_user.login + ", " + link_to("logout", logout_path)
      if current_user.is_admin
        out << ", " + link_to("admin", admin_root_path)
      end
    else
      out << link_to("login",  login_path)
    end
    out.html_safe
  end
  def admin_user_status
    out = ''
    if current_user
      out << current_user.login 
      out << ", @admin_panel"
      out << ", " + link_to("leave panel", root_path)
      out << ", " + link_to("logout", logout_path)
    end
    out.html_safe
  end
end
