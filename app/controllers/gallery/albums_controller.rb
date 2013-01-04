module Gallery
  class AlbumsController < ApplicationController
    before_filter :authenticate_user!
    respond_to :html, :json

    def date_from_params(params)
      new_date = DateTime.new(
        params[:album]["date(1i)"].to_i,
        params[:album]["date(2i)"].to_i,
        params[:album]["date(3i)"].to_i
      )
      params[:album].delete("date(3i)")
      params[:album].delete("date(2i)")
      params[:album].delete("date(1i)")
      return new_date
    end

    def ping 
      respond_with ""
    end

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
        redirect_to edit_gallery_album_path(@album)
      else 
        render new_gallery_album_path
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

      if(@album.errors.empty?) then
        redirect_to(gallery_album_path(@album))
      else
        render edit_gallery_album_path(@album)
      end

    end 
  end
end 
