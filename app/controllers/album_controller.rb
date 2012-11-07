class AlbumController < ApplicationController
  def show
    @album = Album.find params[:id]
    @photos = @album.photos

    @photos.each do |p|
      if !FileTest.exists? p.thumb_path then
        p.make_thumbnail
      end
    end
  end
end
