class Courses::Matter
  include Mongoid::Document
  
  field :name, type: String 
  validates :name, uniqueness: true, format: { with: /^[A-Z]{3,4}[0-9]?$/ }
  field :year, type: String
  validates :year, inclusion: { in: ["1A", "2A", "3A"] }

  validates_presence_of :name, :year

  has_many :documents, class_name: "Courses::Document", inverse_of: :matter, dependent: :destroy
end
