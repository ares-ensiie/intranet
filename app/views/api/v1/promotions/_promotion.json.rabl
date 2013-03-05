attributes :id, :name
node(:number_of_students){ |promotion| promotion.students.count }
child students: :students do
  extends 'api/v1/users/user'
end
