class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home; end

  private

  def sign_in_user(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end
