class UsersController < ApplicationController


  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to "/songs"
    else
      flash[:regerrors] = user.errors.full_messages
      redirect_to '/'
    end
  end
  
  def show
    if User.find_by_id(params[:id])
      @user = User.find(params[:id])
      render 'show'
    else
      redirect_to '/songs'
    end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
