class Abroad::Report
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  field :country, type: String
  field :location, type: String
  field :type, type: String
  field :content, type: String
  field :begin_date, type: Time
  field :end_date, type: Time

  validates_presence_of :country, :location, :type, :content

  belongs_to :owner, class_name: "User"

  # default_scope sort(:country, 1)
end
