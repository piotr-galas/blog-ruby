class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :require_login, only: [:new, :create, :destroy]

  def require_login
    flash[:notice] = "You are not authoraized, please login" if !logged_in?
    super
  end

end
