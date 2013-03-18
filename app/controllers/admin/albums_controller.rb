#encoding: utf-8
class Admin::AlbumsController < Admin::AdminController
  load_and_authorize_resource class: Gallery::Album

  def unrelease
    release(false)
  end

  def release(state = true)
    @album = Gallery::Album.find(params[:album_id])
    @album.published = state;
    @album.save
    respond_with @album, location: admin_albums_path
  end

  def index
  end

  def destroy
    @album.destroy
    respond_with @album, location: admin_albums_path
  end

end
