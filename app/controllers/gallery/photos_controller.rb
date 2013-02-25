class Gallery::PhotosController < ApplicationController
  before_filter :authenticate_user!

  def index
    @imgs = Gallery::Album.find(params[:album_id]).photos
    render json: {files: @imgs.collect { |p| p.to_jq_upload },
      length:@imgs.count}.to_json
  end

  def destroy 
    Gallery::Album.find(params[:album_id]).photos.find(params[:id]).destroy
  end

  def create
    @picture = Gallery::Album.find(params[:album_id]).photos.new(params[:photo])
    if @picture.save
      respond_to do |format|
        format.json {
          render json: {files: [@picture.to_jq_upload], length: 1}.to_json
        }
      end
    else
      render json: [{error: @picture.errors.to_json }], status: 400
    end
  end
end
