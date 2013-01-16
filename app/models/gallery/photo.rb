class Gallery::Photo
  include Mongoid::Document
  include Mongoid::Paperclip
  include Rails.application.routes.url_helpers

  def normalized_photo_file_name
    photo_file_name.to_param
  end

  attr_accessible :photo 
  has_mongoid_attached_file :photo, 
    :styles => { :thumb => Rails.configuration.thumb_height.to_s + "x" + Rails.configuration.thumb_height.to_s + ">" ,
                 :mini => "50x50"},
    :path => ":rails_root/public/photos/:style/:id.:extension",
    :url => "/photos/:style/:id.:extension"

  validates :photo, :attachment_presence => true

  field :name, :type => String, :default => ""
  field :desc, :type => String, :default => ""

  belongs_to :album, :class_name => "Gallery::Album"

  def to_jq_upload
  {
    "name" => photo_file_name,
    "size" => photo_file_size,
    "url" => photo.url(:thumb),
    "thumbnail_url" => photo.url(:thumb),
    "delete_url" => gallery_album_photo_path(album, self),
    "delete_type" => "DELETE"
  }
  end
end
