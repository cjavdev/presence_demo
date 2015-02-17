# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, :nickname, presence: true

  def gravatar(size = 20)
    "https://www.gravatar.com/avatar/#{ Digest::MD5.hexdigest(email) }?s=#{ size }"
  end
end
