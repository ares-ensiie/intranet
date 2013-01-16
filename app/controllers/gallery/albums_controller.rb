class Gallery::AlbumsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource class: Gallery::Album
  respond_to :html, :json

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
    @photo = @album.photos.new
    @current_action = "new"
  end

  def create 
    @album = current_user.albums.create( params[:album] )
    if(@album.errors.empty?) then 
      respond_with @album, location: edit_gallery_album_path(@album)
    else 
      respond_with @album, location: new_gallery_album_path(@album)
    end
  end

  def edit 
    @album = Album.find(params[:id])
    @photo = @album.photos.new 
    @current_action = "edit"
  end 

  def update 
    @album = Album.find(params[:id])
    @album.update_attributes( params[:album] )

    respond_with :gallery, @album
  end 
end
