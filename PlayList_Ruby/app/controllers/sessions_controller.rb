class SessionsController < ApplicationController
  def index
  end
  def login
    if (user = User.find_by_email(params[:email])) && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/songs"
    else
      flash[:logerrors] = "Check email/password and try again."
      redirect_to '/'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
