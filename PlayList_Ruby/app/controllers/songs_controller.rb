class SongsController < ApplicationController


  def index
  end

  def create
    song = Song.new(title: params[:title], artist: params[:artist], user: User.find(session[:user_id]))
    if song.valid?
      song.save
      Add.create(song: Song.last, user: current_user)
    else
      flash[:errors] = song.errors.full_messages
    end
    redirect_to '/songs'
  end

  def show
    if Song.find_by_id(params[:id])
      @song = Song.find(params[:id])
      @users = User.all
    else
      redirect_to '/songs'
    end
  end

  def addexisting
    Add.create(song: Song.find(params[:songid]), user: current_user)
    redirect_to '/songs'
  end

end
