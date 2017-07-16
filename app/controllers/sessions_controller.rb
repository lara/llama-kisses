class SessionsController < ApplicationController
  def new; end

  def create
    sign_in_user oauth_session.user
    if oauth_session.new_user?
      RemindUserToPurchaseWorker.perform_in(3.days, oauth_session.user.id)
    end
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
