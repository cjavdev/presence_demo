class PusherController < ApplicationController
  before_action :require_user
  protect_from_forgery :except => :auth # stop rails CSRF protection for this action

  def auth
    if current_user
      response = Pusher[params[:channel_name]].authenticate(params[:socket_id], {
        user_id: current_user.id, # => required
        user_info: { # => optional - for example
          nickname: current_user.nickname,
          email: current_user.email
        }
      })
      render :json => response
    else
      render :text => "Forbidden", :status => '403'
    end
  end
end
