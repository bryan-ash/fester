
class ApplicationController < ActionController::Base

  helper :all

  protect_from_forgery

  filter_parameter_logging :password, :password_confirmation

  before_filter :authorize_access
  before_filter :sanitize_params

  helper_method :current_user

  private

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session && current_user_session.record
  end

  def logged_in?
    return true if current_user
  end

  def current_path
    url_for :only_path => true
  end

  def authorize_access
    return redirect_to(root_path) unless logged_in?
    return redirect_to(current_user.entry_page_path) unless current_user.permitted_to_access? current_path
  end

end
