Promotion.create(name: "2012")

User.create(
  username: "toto",
  first_name: "toto",
  last_name: "toto",
  nick_name: "toto",
  gender: "F",
  email: "toto@mail.com",
  #is_admin: true,
  promotion: Promotion.first,
  password: "oooooo",
  password_confirmation: "oooooo"
)

user = User.new()
user.username = "titi"
user.first_name = "titi"
user.last_name = "titi"
user.nick_name = "titi"
user.gender = "M"
user.email = "titi@mail.com"
  #is_admin: true,
user.promotion = Promotion.first
user.password = "i" * 6
user.password_confirmation = "i" * 6


user.save!
