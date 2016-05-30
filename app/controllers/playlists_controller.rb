class PlaylistsController < ApplicationController

  def index
    @playlist = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
   @playlist = Playlist.create(playlist_params)
   redirect_to @playlist
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update(playlist_params)
      redirect_to @playlist
    else
      render :edit
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end


 private
  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end
end
