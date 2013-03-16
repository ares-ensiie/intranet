attributes :id, :username, :first_name, :last_name, :email, :gender
node(:promotion) { |user| user.promotion.name }
node(:avatar) { |user| partial 'api/v1/users/avatar', object: user.avatar }
