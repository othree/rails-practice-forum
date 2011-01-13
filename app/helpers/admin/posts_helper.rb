module Admin::PostsHelper
  def admin_edit_delete_link(post)
    out = ""
    out << "<p>"
    out << link_to('edit post', edit_admin_forum_post_path(post.forum_id, post))
    out << ","
    out << link_to('delete post', admin_forum_post_path(post.forum_id, post), :method => :delete)
    out << "</p>"
    out.html_safe
  end
end
