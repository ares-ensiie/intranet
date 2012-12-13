module Gallery
  class AlbumsController < ApplicationController
    before_filter :authenticate_user!
    respond_to :html, :json

    def index 
      redirect_to "/gallery"
    end

    def show
      @album = Album.find(params[:id])
    end

    def new
      @album = Album.new
    end

    def create 
      @album = current_user.albums.create(params[:album], :author => current_user)
      if(@album.errors.empty?) then 
        redirect_to edit_album_path(@album)
      else 
        render "albums/new"
      end
    end

    def edit 
      @album = Album.find(params[:id])
    end 

    def update 
      @album = Album.find(params[:id])
      new_date = DateTime.new(
        params[:album]["date(1i)"].to_i,
        params[:album]["date(2i)"].to_i,
        params[:album]["date(3i)"].to_i
      )
      params[:album].delete("date(3i)")
      params[:album].delete("date(2i)")
      params[:album].delete("date(1i)")
      @album.update_attributes(params[:album], :date => new_date)
      if(@album.errors.empty?) then
        respond_with(@album)
      else
        render edit_gallery_album_path(@album)
      end

    end 
  end
end 
