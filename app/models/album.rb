class Album
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  field :name, :type => String, :default => ""
  field :desc, :type => String, :default => ""
  field :date, :type => DateTime
  validates :name, :presence => true, :uniqueness => true

  belongs_to :author, :class_name => "User", :inverse_of => :albums
  has_many :photos, :class_name => "Photo"
end
