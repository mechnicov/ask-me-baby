module ApplicationHelper
  include Pagy::Frontend

  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_url 'avatar.png'
    end
  end

  def question_time(question)
    l(question.created_at, format: '%-d %B %Y %k:%M')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
