# Main appliationn controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :require_login, only: [:new, :edit, :create, :destroy]

  def require_login
    flash[:notice] = 'You are not authoraized, please login' unless logged_in?
    super
  end

  def redirect_back_not_owner
    flash[:notice] = 'You are not owner, you can\'t edit this resource'
    redirect_to(:back)
  end
end
