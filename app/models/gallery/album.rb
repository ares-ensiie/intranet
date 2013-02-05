class Gallery::Album
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  field :name, :type => String, :default => ""
  field :desc, :type => String, :default => ""
  field :date, :type => DateTime
  field :published, :type => Boolean, :default => false

  validates :name, :presence => true, :uniqueness => true

  belongs_to :author, :class_name => "User", :inverse_of => :albums
  has_many :photos, :class_name => "Gallery::Photo"

  attr_accessible :name, :desc, :date
end
