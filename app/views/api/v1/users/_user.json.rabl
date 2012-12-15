attributes :id, :username, :first_name, :last_name, :email, :avatar_url
node(:promotion) { |user| user.promotion.name }
