FactoryGirl.define do
  factory :document do
    ignore do
      now DateTime.now
      attached_file File.open("public/robots.txt")
    end

    sequence(:name) { |i| "document#{i}" }
    type 'Cours'
    file attached_file
    release_date now 
    author
  end
end

    
