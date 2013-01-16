class Gallery::AlbumsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource class: Gallery::Album
  respond_to :html, :json

  def show
  end 

  def destroy
    @album.destroy
    respond_with @album, location: gallery_root_path
  end

  def new
    @photo = @album.photos.new
    @current_action = "new"
  end

  def create 
    @album.author = current_user
    @album.save
    if(@album.errors.empty?) then 
      respond_with @album, location: edit_gallery_album_path(@album)
    else 
      respond_with @album, location: new_gallery_album_path(@album)
    end
  end

  def edit
    @photo = @album.photos.new 
    @current_action = "edit"
  end 

  def update 
    @album.update_attributes(params[:gallery_album])
    if current_user.is_admin?  \
      and params[:gallery_album].has_key? :published then
      @album.published = params[:gallery_album][:published]
      @album.save
    end
    respond_with @album
  end 
end
