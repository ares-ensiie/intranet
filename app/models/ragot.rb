class Ragot
  include Mongoid::Document

  field "content", :type => String, :default => ""
  field "date", :type => DateTime, :default => nil
  field "score", :type => Integer, :default => 0
  
  belongs_to :author, class_name: "User"

  validates :content, :presence => true
  validates :date, :presence => true 
  validates :author, :presence => true 

end
