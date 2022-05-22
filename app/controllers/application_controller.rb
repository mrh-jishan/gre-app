class ApplicationController < ActionController::API
  before_action :set_current_user

  def set_current_user
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: 'You must be signed in' if @user.nil?
  end
end
