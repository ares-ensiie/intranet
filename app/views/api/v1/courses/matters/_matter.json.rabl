attributes :name, :year
child documents: :documents do
  extends 'api/v1/courses/documents/document'
end
