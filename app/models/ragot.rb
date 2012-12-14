class Ragot
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessible :content, :date, :score, :author

  field :content
  field :date, type: DateTime
  field :score, type: Integer, default: 0

  belongs_to :author, class_name: "User"

  validates :content, presence: true
  validates :date, presence: true
  validates :author, presence: true
end
