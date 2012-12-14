promotion_2010 = Promotion.create! name: '2010'

users = []
users << (promotion_2010.students.create! username: "user1", email: "user1@example.com", password: "tototo",
          first_name: 'Utilisateur', last_name: 'Premier',
          confirmed_at: DateTime.now, confirmation_token: 'Grandfathered Account',
          confirmation_sent_at: DateTime.now)
users << (promotion_2010.students.create! username: "user2", email: "user2@example.com", password: "tototo",
          first_name: 'Utilisateur', last_name: 'Premier',
          confirmed_at: DateTime.now, confirmation_token: 'Grandfathered Account',
          confirmation_sent_at: DateTime.now)

User.first.update_attribute :is_admin, true

users.each do |u|
  Ragot.create! author: u, date: DateTime.now, content: "Ragot1 de " + u.username
  Ragot.create! author: u, date: DateTime.now, content: "Ragot2 de " + u.username
  Ragot.create! author: u, date: DateTime.now, content: "Ragot3 de " + u.username
end

a = Album.create! name: "Album1", author: users[0]
a.photos.create! photo: File.open(Rails.root + "./public/albums/" + a.name + "284f48e7356cfcb85d3c0f21647adfef433fd298.jpg")
a.photos.create! photo: File.open(Rails.root + "./public/albums/" + a.name + "3f0692cae65e30dbcb619e5338f2d1ea32203e46.jpg")
a.photos.create! photo: File.open(Rails.root + "./public/albums/" + a.name + "6392210b1424027836509d6c595f1e5e716dabd6.jpg")
a.photos.create! photo: File.open(Rails.root + "./public/albums/" + a.name + "73b0ad03f021c25062a0cc6f5203636a7aa5bc10.jpg")
a.photos.create! photo: File.open(Rails.root + "./public/albums/" + a.name + "ac8c9861c83d5fedf84f934af69d89da154c3d87.jpg")
a.photos.create! photo: File.open(Rails.root + "./public/albums/" + a.name + "d8516aac4e11e9f9a6cc65c9f6b23d0eac981e17.jpg")
a.photos.create! photo: File.open(Rails.root + "./public/albums/" + a.name + "db95eb1a0fa51254ce4650243e89bbe48c8a482c.jpg")

%w(IPI MOM MTG IPF ISI).each do |c|
  User.first.documents.create! name: "Cours#{c}", course_label: c, type: "Cours", promo: "1A", :release_date => DateTime.now, :file_path => "/documents/a.pdf"
end

%w(MAD MRO ILSF ILO IMW).each do |c|
  User.all[1].documents.create! name: "Cours#{c}", course_label: c, type: "Cours", promo: "2A", :release_date => DateTime.now, :file_path => "/documents/a.pdf"
end
