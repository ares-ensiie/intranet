promotion_2010 = Promotion.create! name: '2010'

users = []
users << (promotion_2010.students.create! username: "user1", email: "user1@example.com", password: "tototo",
          first_name: 'Utilisateur', last_name: 'Premier',
          confirmed_at: DateTime.now, confirmation_token: 'Grandfathered Account',
          confirmation_sent_at: DateTime.now)
users << (promotion_2010.students.create! username: "user2", email: "user2@example.com", password: "tototo",
          first_name: 'Utilisateur', last_name: 'Second',
          confirmed_at: DateTime.now, confirmation_token: 'Grandfathered Account',
          confirmation_sent_at: DateTime.now)

User.first.update_attribute :is_admin, true

users.each do |u|
  Ragot.create! author: u, date: DateTime.now, content: "Ragot1 de " + u.username
  Ragot.create! author: u, date: DateTime.now, content: "Ragot2 de " + u.username
  Ragot.create! author: u, date: DateTime.now, content: "Ragot3 de " + u.username
end

a = Album.create! name: "Album1", author: users[0]
