class User < ActiveRecord::Base
  validates :email, :nickname, presence: true

  def gravatar(size = 20)
    "https://www.gravatar.com/avatar/#{ Digest::MD5.hexdigest(email) }?s=#{ size }"
  end
end
