class AuthorSessionsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    author = login(params[:username], params[:password])
    if author
      flash[:message] = "Logged in successfully."
      redirect_to(articles_path)
    else
      flash[:message] = "Login failed."
      render :action => :new
    end
  end

  def destroy
    logout
    flash[:message] = "Logged out successfully."
    redirect_to(articles_path)
  end
end
