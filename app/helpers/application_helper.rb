module ApplicationHelper
  include Pagy::Frontend

  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_url 'avatar.png'
    end
  end

  def bgcolor(user)
    if user.bgcolor.present?
      user.bgcolor
    else
      '#ecb8a5'
    end
  end

  def author(question)
    from_whom = if question.author.present?
                  link_to "@#{question.author.username}", user_url(question.author)
                else
                  'анонимного пользователя'
                end
    "Вопрос от #{from_whom}"
  end

  def question_time(question)
    l(question.created_at, format: '%-d %B %Y %k:%M')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
