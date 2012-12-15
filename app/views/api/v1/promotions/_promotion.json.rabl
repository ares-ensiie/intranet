attributes :name
child students: :students do
  extends 'api/v1/users/user'
end
