class Gallery::PhotosController < ApplicationController
  before_filter :authenticate_user!

  def index
    @imgs = Album.find(params[:album_id]).photos
    render json: @imgs.collect { |p| p.to_jq_upload }.to_json
  end

  def destroy 
    Album.find(params[:album_id]).photos.find(params[:id]).destroy
  end

  def create
    @picture = Album.find(params[:album_id]).photos.new(params[:photo])
    if @picture.save
      respond_to do |format|
        format.json {
          render json: [@picture.to_jq_upload].to_json
        }
      end
    else
      render json: [{error: @picture.errors.to_json }], status: 400
    end
  end
end
