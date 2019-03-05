module QuestionsHelper
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

  def replace_hashtags_with_links(text)
    text.gsub(HASHTAG_REGEX) { |ht| link_to ht, hashtag_url(ht.delete('#').downcase)}.html_safe
  end
end
