class Document
  include Mongoid::Document
  
  field :name, :type => String

  field :course_label, :type => String
  validates :course_label, :length => { :in => 3..4 }

  field :file_path, :type => String

  field :type, :type => String
  validates :type, :inclusion => { :in => ["Cours", "TD", "TP", "Autre"] }

  field :promo, :type => String
  validates :promo, :inclusion => { :in => ["1A", "2A", "3A"] }

  # Initialize when the user has uploaded the file
  field :release_date, :type => Date

  field :is_obsolete, :type => Boolean, :default => false
  validates :is_obsolete, :inclusion => { :in => [true, false] }

  belongs_to :author, :class_name => "User", :inverse_of => :documents

  validates_presence_of :author, :name, :course_label, :promo, :file_path, :type
end
