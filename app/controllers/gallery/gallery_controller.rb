class Gallery::GalleryController < ApplicationController
  before_filter :authenticate_user!

  def index 
    if current_user.is_admin? then
      @albums_unpublished = Gallery::Album.where published: false
    else
      @albums_unpublished = Gallery::Album.and({published: false}, {author: current_user})
    end
    @albums = Gallery::Album.where(published: true).order_by name: :asc
  end
end
