class AuthorSessionsController < ApplicationController

  before_filter :require_login, only: []
  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to(articles_path, notice: 'Logged in success')
    else
      flash.now.alert = "login failed"
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, notice: 'logged out')
  end

end
