module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_url 'avatar.png'
    end
  end

  def questions_qty(user)
    I18n.t :question, count: user.questions.count
  end

  def question_time(question)
    l(question.created_at, format: '%-d %B %Y %k:%M')
  end
end
