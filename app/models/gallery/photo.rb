class Gallery::Photo
  include Mongoid::Document
  include Mongoid::Paperclip
  include Rails.application.routes.url_helpers

  def normalized_photo_file_name
    photo_file_name.to_param
  end

  has_mongoid_attached_file :photo, 
    styles: { 
      thumb_square: "#{Rails.configuration.thumb_height.to_s}x#{Rails.configuration.thumb_height.to_s}#" ,
      thumb: "#{Rails.configuration.thumb_height.to_s}x#{Rails.configuration.thumb_height.to_s}>" ,
      mini: "50x50"
    }

  validates :photo, attachment_presence: true

  field :name, type: String, default: ""
  field :desc, type: String, default: ""

  belongs_to :album, class_name: "Gallery::Album"

  def to_jq_upload
  {
    "name" => photo_file_name,
    "size" => photo_file_size,
    "url" => photo.url,
    "thumbnail_url" => photo.url(:thumb_square),
    "delete_url" => gallery_album_photo_path(album, self),
    "delete_type" => "DELETE"
  }
  end
end
