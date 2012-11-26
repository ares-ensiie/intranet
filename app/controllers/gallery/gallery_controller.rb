module Gallery 
  class GalleryController < ApplicationController
    before_filter :authenticate_user!

    def index 
      @albums = Album.order_by name: :asc
    end
  end
end
