class AlbumController < ApplicationController
  before_filter :authenticate_user!

  def index 
    redirect_to "/gallery"
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
  end
end
