class Courses::Document
  include Mongoid::Document
  include Mongoid::Paperclip
  
  has_mongoid_attached_file :file, url: "/courses/documents/:id.:extension"
  validates :file, attachment_presence: true
  validates :file, attachment_content_type: { 
    content_type: ["application/xpdf", "application/pdf", "application/x-gzip", 
      "application/msword", "text/plain", "application/msexcel",
      "application/zip", "image/jpg", "image/png", "multipart/x-zip", "multipart/x-gzip"] }

  field :name, type: String

  field :type, type: String
  validates :type, inclusion: { in: ["Cours", "TD", "TP", "Autre"] }

  # Initialize when the user has uploaded the file
  field :release_date, type: Date

  field :is_obsolete, type: Boolean, default: false
  validates :is_obsolete, inclusion: { in: [true, false] }

  belongs_to :author, class_name: "User", inverse_of: :documents
  belongs_to :matter, class_name: "Courses::Matter", inverse_of: :documents

  validates_presence_of :author, :name, :matter, :type
end
