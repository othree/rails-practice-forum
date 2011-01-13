module PostsHelper
  def edit_delete_link(post)
    out = ""
    if current_user.id == post.user_id
      out << "<p>"
      out << link_to('edit post', edit_forum_post_path(post.forum_id, post))
      out << ","
      out << link_to('delete post', forum_post_path(post.forum_id, post), :method => :delete)
      out << "</p>"
    end
    out.html_safe
  end
end
