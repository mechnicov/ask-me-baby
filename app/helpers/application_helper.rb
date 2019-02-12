module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_url 'avatar.png'
    end
  end

  def questions_qty(user)
    qty = user.questions.count

    remainder = qty % 100
    if remainder >= 11 && remainder <= 14
      return "#{qty} вопросов"
    end

    remainder = qty % 10
    if remainder == 1
      "#{qty} вопрос"
    elsif remainder >=2 && remainder <= 4
      "#{qty} вопроса"
    else
      "#{qty} вопросов"
    end
  end
end
