class OnlineUsersController < ApplicationController
  before_action :require_user
  before_action :get_users
  after_action :set_users

  def show
    render json: @rails_cached_users
  end

  def create
    add_user
    # Pusher['presence'].trigger('add_user', user_hash)
    render json: @rails_cached_users
  end

  def destroy
    remove_user
    # Pusher['presence'].trigger('remove_user', user_hash)
    render json: @rails_cached_users
  end

  private

  def user_hash
    {
      email: current_user.email,
      nickname: current_user.nickname
    }
  end

  def add_user
    @rails_cached_users << user_hash unless @rails_cached_users.include?(user_hash)
  end

  def remove_user
    @rails_cached_users.delete_if { |u| u[:email] == current_user.email }
  end

  def get_users
    @rails_cached_users ||= Rails.cache.read('users') || Set.new
  end

  def set_users
    Rails.cache.write('users', @rails_cached_users.to_a)
  end
end
