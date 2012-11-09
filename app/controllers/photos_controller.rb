class PhotosController < ApplicationController
  include PhotosHelper

  def show
    photo = Photo.find params[:id]
    send_file photo.abs_photo_path, :type => (content_type photo)
  end

  def thumb
    photo = Photo.find params[:id]
    send_file photo.abs_thumb_path, :type => (content_type photo)
  end
end
