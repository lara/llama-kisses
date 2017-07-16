class SessionsController < ApplicationController
  def new; end

  def create
    sign_in_user oauth_session.user
    UserMailer.sign_in_email(current_user).deliver_later(wait: 10.seconds)
    redirect_to request.env["omniauth.origin"]
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def oauth_session
    @session ||= Session.new(request.env["omniauth.auth"])
  end
end
