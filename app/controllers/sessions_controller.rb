class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(user_params).first_or_create
    if @user.valid?
      session[:email] = @user.email
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    session[:email] = nil
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname)
  end
end
