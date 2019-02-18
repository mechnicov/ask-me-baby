module UsersHelper
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

  def fontcolor(user)
    if user.fontcolor.present?
      user.fontcolor
    else
      '#904c77'
    end
  end

  def bordercolor(user)
    if user.bordercolor.present?
      user.bordercolor
    else
      '#957d95'
    end
  end
end
