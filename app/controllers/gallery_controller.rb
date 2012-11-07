class GalleryController < ApplicationController
  def index 
    @albums = Album.all
  end
end
