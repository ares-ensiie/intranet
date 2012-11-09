class GalleryController < ApplicationController
  before_filter :authenticate_user!

  def index 
    @albums = Album.all
  end
end
