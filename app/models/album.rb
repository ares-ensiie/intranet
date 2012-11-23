class Album
  include Mongoid::Document

  field :name, :type => String, :default => ""
  field :desc, :type => String, :default => ""
  field :date, :type => DateTime
  validates :name, :presence => true, :uniqueness => true

  belongs_to :author, :class_name => "User"
  has_many :photos, :class_name => "Photo"
end
