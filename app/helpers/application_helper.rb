module ApplicationHelper
  def gravatar_for(email, size = 20)
    "https://www.gravatar.com/avatar/#{ Digest::MD5.hexdigest(email) }?s=#{ size }"
  end
end
