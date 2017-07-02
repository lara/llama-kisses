class SessionsController < ApplicationController
  def new; end

  def create
    sign_in_user User.find_or_create_from_omniauth_payload(request.env["omniauth.auth"])
    redirect_to request.env["omniauth.origin"]
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
