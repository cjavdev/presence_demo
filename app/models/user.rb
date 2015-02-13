class User < ActiveRecord::Base
  validates :email, :nickname, presence: true
end
