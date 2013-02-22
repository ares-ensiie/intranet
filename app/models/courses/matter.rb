class Courses::Matter
  include Mongoid::Document
  include Mongoid::Slug
  
  field :name, type: String 
  validates :name, uniqueness: true
  field :year, type: String
  validates :year, inclusion: { in: ["1A", "2A", "3A"] }

  slug :name

  validates_presence_of :name, :year

  has_many :documents, class_name: "Courses::Document", inverse_of: :matter, dependent: :destroy
end
