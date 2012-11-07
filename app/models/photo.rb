require 'RMagick'

class Photo
  include Mongoid::Document

  field :file, :type => String
  validates :file, :presence => true, :uniqueness => true 

  field :name, :type => String, :default => ""
  field :desc, :type => String, :default => ""

  belongs_to :album, :class_name => "Album"


  def photo_path
    "/albums/" + self.album.name + "/" + self.file
  end

  def thumb_folder
    "/albums/" + self.album.name + "/thumbs/"
  end

  def abs_thumb_folder
    Rails.root.join('public').to_s + self.thumb_folder
  end

  def thumb_path
    self.thumb_folder + self.file
  end

  def abs_photo_path
    Rails.root.join('public').to_s + self.photo_path
  end

  def abs_thumb_path
    Rails.root.join('public').to_s + self.thumb_path
  end

  def make_thumbnail
    if !FileTest.exist? self.abs_thumb_folder then
      Dir.mkdir self.abs_thumb_folder
    end

    height = Rails.configuration.thumb_height
    image = Magick::Image.read(self.abs_photo_path).first
    ratio = image.rows.to_f/height 
    new_geo = (image.columns/ratio).to_s + 'x' + height.to_s
    image.change_geometry!(new_geo) do |cols, rows, img|
      newimg = img.resize(cols, rows)
      newimg.write(self.abs_thumb_path)
    end
  end
end
