class Photo
  include Mongoid::Document
  include Mongoid::Paperclip

  attr_accessible :photo 
  has_mongoid_attached_file :photo, 
    :styles => { :thumb => Rails.configuration.thumb_height.to_s + "x" + Rails.configuration.thumb_height.to_s + ">" },
    :path => ":rails_root/public/photos/:style/:id.:extension",
    :url => "/photos/:style/:id.:extension"

  validates :photo, :attachment_presence => true

  field :name, :type => String, :default => ""
  field :desc, :type => String, :default => ""

  belongs_to :album, :class_name => "Album"
end
