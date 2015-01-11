#Promotions
Promotion.create(name: "2012")
Promotion.create(name: "2013")
Promotion.create(name: "2014")

#Users
User.create(
  username: "toto",
  first_name: "toto",
  last_name: "toto",
  gender: "F",
  email: "toto@mail.com",
  #is_admin: true,
  promotion: Promotion.first,
  password: "oooooo",
  password_confirmation: "oooooo",
  confirmed_at: DateTime.now
)
User.create(
  username: "titi",
  first_name: "titi",
  last_name: "titi",
  gender: "M",
  email: "titi@mail.com",
  #is_admin: true,
  promotion: Promotion.last,
  password: "iiiiii",
  password_confirmation: "iiiiii",
  confirmed_at: DateTime.now
)

#Matters
Courses::Matter.create(
  name: "COM",
  year: "1A"
)
Courses::Matter.create(
  name: "ALGO",
  year: "2A"
)

#Album
Gallery::Album.create(
  name: "Inte",
  desc: "L'intégration",
  date: DateTime.yesterday,
  #author: User.first,
  #published: true
)
