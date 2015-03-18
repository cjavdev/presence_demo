class StaticPagesController < ApplicationController
  before_action :require_user

  def root
    # OPTION 1
    @recently_logged_in_users = User.where('updated_at > ?', 30.seconds.ago)

    # OPTION 2
    @rails_cached_users ||= Rails.cache.read('users') || []
  end

  # OPTION 1
  before_action :touch_current_user
  def touch_current_user
    puts "TOUCHING CURRENT USER"
    current_user.try(:touch)
  end
end
