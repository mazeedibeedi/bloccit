module UsersHelper
  def render_posts(posts, favorite = false)
    if posts.any?
      render(posts)
    else
      "#{@user.name} has not #{favorite ? 'favorited' : 'submitted'} any posts yet".html_safe
    end
  end

  def render_comments(user)
    if user.comments.any?
      render(user.comments)
    else
      "#{user.name} has not submitted any comments yet".html_safe
    end
  end
end
