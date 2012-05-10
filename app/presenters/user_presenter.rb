class UserPresenter < BasePresenter 
  presents :user
  
  def avatar_big
    user.profile.avatar.url.present? ? h.image_tag(user.profile.avatar.url(:big)) : h.image_tag("dummy_big.jpg")
  end
  
  def avatar
    user.profile.avatar.url.present? ? h.image_tag(user.profile.avatar.url(:big)) : h.image_tag("dummy_user.jpg")
  end
  
  def username
    user.username
  end
  
  def name
    handle_none user.profile.name do
      user.profile.name
    end
  end
  
  def birthday
    handle_none user.profile.birthday do
      user.profile.birthday.strftime("%B %e, %Y")
    end
  end
  
  def street
    handle_none user.profile.street do
      user.profile.street
    end
  end
  
  def city
    handle_none user.profile.city do
      user.profile.city
    end
  end
  
  def adress
    handle_none get_adress do
      get_adress
    end
  end
  
  def email
    h.mail_to user.email, user.email, :encode => 'hex'
  end
  
  def member_since
    handle_none user.profile.in_company_since do
      user.profile.in_company_since.strftime("%B %e, %Y")
    end
  end

  def phone
    handle_none user.profile.phone do
      user.profile.phone
    end
  end
  
  def job_description
    handle_none user.profile.job_description do
      user.profile.job_description
    end
  end

  def website
    handle_none user.profile.website do
      h.link_to(user.profile.website, user.profile.website)
    end
  end
  
  def bio
    handle_none user.profile.bio do
      h.markdown(user.profile.bio)
    end
  end
  
private
  
  def get_adress
    if !user.profile.street.nil? && !user.profile.city.nil? && !user.profile.zip.nil?
      "#{user.profile.street}, #{user.profile.zip} #{user.profile.city}"
    elsif !user.profile.street.nil? && !user.profile.city.nil?
       "#{user.profile.street}, #{user.profile.city}"
    elsif !user.profile.city.nil?
       user.profile.city
    else
       nil
    end
  end

  def handle_none(value)
    if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"
    end
  end
     
end