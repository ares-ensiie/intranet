promotion_2010 = Promotion.create! name: '2010'
promotion_2011 = Promotion.create! name: '2011'

promotion_2010.students.create! username: "admin", email: "admin@example.com", password: "adminadmin",
          first_name: 'Admin', last_name: 'Istrateur',
          confirmed_at: DateTime.now, confirmation_token: 'Grandfathered Account',
          confirmation_sent_at: DateTime.now

users = []
users << (promotion_2010.students.create! username: "user1", email: "user1@example.com", password: "tototo",
          first_name: 'Utilisateur', last_name: 'Premier',
          confirmed_at: DateTime.now, confirmation_token: 'Grandfathered Account',
          confirmation_sent_at: DateTime.now)
users << (promotion_2011.students.create! username: "user2", email: "user2@example.com", password: "tototo",
          first_name: 'Utilisateur', last_name: 'Second',
          confirmed_at: DateTime.now, confirmation_token: 'Grandfathered Account',
          confirmation_sent_at: DateTime.now)

User.first.update_attribute :is_admin, true

%w(IPI MOM MTG IPF ISI).each do |c|
    m = Courses::Matter.create name: c, year: "1A"
      m.documents.create! author: User.all[1], name: "Cours#{c}", matter: m, type: "Cours", release_date: DateTime.now, file: File.open(Rails.root + "./public/documents/a.pdf")
end

%w(MAD MRO ILSF ILO IMW).each do |c|
    m = Courses::Matter.create name: c, year: "2A"
      m.documents.create! author: User.all[2], name: "Cours#{c}", matter: m, type: "Cours", release_date: DateTime.now, file: File.open(Rails.root + "./public/documents/a.pdf")
end
