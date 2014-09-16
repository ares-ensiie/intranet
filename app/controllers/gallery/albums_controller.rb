class Gallery::AlbumsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource class: Gallery::Album, param_method: :resource_params
  respond_to :html, :json

  def show
  end

  def new
    @photo = @album.photos.new
    @current_action = "new"
  end

  def create
    @album.author = current_user
    @album.save
    respond_with [:gallery, @album], location: new_gallery_album_path(@album)
  end

  def edit
    @photo = @album.photos.new
    @current_action = "edit"
  end

  def update
    @album.update_attributes(resource_params)
    respond_with @album
  end

  protected
  def resource_params
    params.require(:gallery_album).permit(:name, :date, :desc)
  end
end
