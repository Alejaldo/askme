module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'default-avatar.png'
    end
  end

  def inclination(number, one, few, many)
    return many if (number % 100).between?(11, 14)

    case number % 10
    when 1 then one
    when 2..4 then few
    else many
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def user_background_color
    if @user.background_color.present?
      @user.background_color
    else
      "#005a55"
    end
  end

  def linked_hash_tags(question_part)
    sanitize question_part.gsub(/#[[:word:]]+/) { |tag| link_to tag, hash_tag_path(tag.delete('#').downcase) }
  end
end
