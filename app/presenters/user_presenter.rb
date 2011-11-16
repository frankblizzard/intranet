class UserPresenter < BasePresenter 
  presents :user
  
  def avatar_big
    user.profile.avatar.url.present? ? h.image_tag(user.profile.avatar.url(:big)) : h.image_tag("dummy_big.jpg")
  end
  
  def avatar
    user.profile.avatar.url.present? ? h.image_tag(user.profile.avatar.url(:big)) : h.image_tag("dummy_user.jpg")
  end
  
  def userinfo
    "#{user.profile.first_name}"
  end
  
  def birthday
    handle_none user.profile.birthday
  end
  
  def bio
    handle_none user.profile.bio do
      h.markdown(user.bio)
    end
  end
  
private

  def handle_none(value)
    if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"
    end
  end
     
end