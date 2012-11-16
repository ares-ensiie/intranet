# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

users = []
users << (User.create username: "user1", email: "user1@example.com", password: "tototo")
users << (User.create username: "user2", email: "user2@example.com", password: "tototo")
users << (User.create username: "user3", email: "user3@example.com", password: "tototo")
users << (User.create username: "user4", email: "user4@example.com", password: "tototo")

users.each do |u|
  Ragot.create author: u, date: DateTime.now, content: "Ragot1 de " + u.username 
  Ragot.create author: u, date: DateTime.now, content: "Ragot2 de " + u.username 
  Ragot.create author: u, date: DateTime.now, content: "Ragot3 de " + u.username 
end 

a = Album.create name: "Album1", author: users[0]
a.photos.create photo: File.open(Rails.root + "./public/albums/" + a.name + "284f48e7356cfcb85d3c0f21647adfef433fd298.jpg")
a.photos.create photo: File.open(Rails.root + "./public/albums/" + a.name + "3f0692cae65e30dbcb619e5338f2d1ea32203e46.jpg")
a.photos.create photo: File.open(Rails.root + "./public/albums/" + a.name + "6392210b1424027836509d6c595f1e5e716dabd6.jpg")
a.photos.create photo: File.open(Rails.root + "./public/albums/" + a.name + "73b0ad03f021c25062a0cc6f5203636a7aa5bc10.jpg")
a.photos.create photo: File.open(Rails.root + "./public/albums/" + a.name + "ac8c9861c83d5fedf84f934af69d89da154c3d87.jpg")
a.photos.create photo: File.open(Rails.root + "./public/albums/" + a.name + "d8516aac4e11e9f9a6cc65c9f6b23d0eac981e17.jpg")
a.photos.create photo: File.open(Rails.root + "./public/albums/" + a.name + "db95eb1a0fa51254ce4650243e89bbe48c8a482c.jpg")
