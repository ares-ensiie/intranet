class Courses::Matter
  include Mongoid::Document
  
  field :name, type: String 
  validates :name, uniqueness: true, format: { with: /[A-Z]{3,4}\d?/ }
  field :year, type: String
  validates :year, inclusion: { in: ["1A", "2A", "3A"] }

  has_many :documents, class_name: "Courses::Document", inverse_of: :matter, dependent: :destroy
end
