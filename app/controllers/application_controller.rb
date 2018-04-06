class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user
  helper_method :current_user, :is_logged_in?

  def current_user
    if is_logged_in?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def is_logged_in?
    session[:user_id].present?
  end

end
