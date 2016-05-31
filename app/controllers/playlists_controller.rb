class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

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
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to @playlist
    else
      render :edit
    end
  end

  def edit
  end


 private
  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

end
