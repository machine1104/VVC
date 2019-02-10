User.create!(username: 'admin',
             email: 'admin@vvc.com',
             password: 'password',
             password_confirmation: 'password',
             admin: true)

User.create!(username: 'pincopallo',
             email: 'pincopallo@gmail.com',
             password: 'password',
             password_confirmation: 'password',
             admin: false)
             
User.create!(username: 'utentetest',
             email: 'utentetest@gmail.com',
             password: 'password',
             password_confirmation: 'password',
             admin: false)

30.times do |_n|
  username = Faker::Internet.user_name(5..20)
  email = Faker::Internet.email
  password = Faker::Internet.password(8)
  User.create!(username: username,
               email: email,
               password: password,
               password_confirmation: password)
end

2.times do |_n|
  user_id = 2
  titolo = Faker::Commerce.product_name
  categoria = 'Arredamento'
  descrizione = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis pulvinar libero at volutpat.
                 Suspendisse potenti. Nullam malesuada mollis dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                 Integer leo dolor, vehicula sed sem egestas, suscipit semper magna. Nullam lacus nunc, tincidunt sed ultricies eu, luctus sed elit.
                 Fusce eu consequat magna, a euismod ante. Ut a ipsum eget risus gravida eleifend. Pellentesque porta quis urna id elementum. Integer
                 hendrerit arcu vitae nibh auctor, et feugiat sapien sollicitudin. Sed commodo, urna vel tempor congue, tortor urna laoreet lectus, et
                 tempus justo mauris ut mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  posizione = 'Roma'
  regione = 'Lazio'
  email = 'pincopallo@gmail.com'
  telefono = ''
  prezzo = Faker::Commerce.price
  Announcement.create!(user_id: user_id,
                       titolo: titolo,
                       categoria: categoria,
                       descrizione: descrizione,
                       posizione: posizione,
                       regione: regione,
                       email: email,
                       telefono: telefono,
                       prezzo: prezzo)
end

2.times do |_n|
  user_id = 3
  titolo = Faker::Commerce.product_name
  categoria = 'Elettrodomestici'
  descrizione = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis pulvinar libero at volutpat.
                 Suspendisse potenti. Nullam malesuada mollis dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                 Integer leo dolor, vehicula sed sem egestas, suscipit semper magna. Nullam lacus nunc, tincidunt sed ultricies eu, luctus sed elit.
                 Fusce eu consequat magna, a euismod ante. Ut a ipsum eget risus gravida eleifend. Pellentesque porta quis urna id elementum. Integer
                 hendrerit arcu vitae nibh auctor, et feugiat sapien sollicitudin. Sed commodo, urna vel tempor congue, tortor urna laoreet lectus, et
                 tempus justo mauris ut mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  posizione = 'Milano'
  regione = 'Lombardia'
  email = 'francescomaria@gmail.com'
  telefono = ''
  prezzo = Faker::Commerce.price
  Announcement.create!(user_id: user_id,
                       titolo: titolo,
                       categoria: categoria,
                       descrizione: descrizione,
                       posizione: posizione,
                       regione: regione,
                       email: email,
                       telefono: telefono,
                       prezzo: prezzo)
end

2.times do |_n|
  user_id = 4
  titolo = Faker::Commerce.product_name
  categoria = 'Elettronica'
  descrizione = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis pulvinar libero at volutpat.
                 Suspendisse potenti. Nullam malesuada mollis dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                 Integer leo dolor, vehicula sed sem egestas, suscipit semper magna. Nullam lacus nunc, tincidunt sed ultricies eu, luctus sed elit.
                 Fusce eu consequat magna, a euismod ante. Ut a ipsum eget risus gravida eleifend. Pellentesque porta quis urna id elementum. Integer
                 hendrerit arcu vitae nibh auctor, et feugiat sapien sollicitudin. Sed commodo, urna vel tempor congue, tortor urna laoreet lectus, et
                 tempus justo mauris ut mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  posizione = 'Milano'
  regione = 'Lombardia'
  email = 'alessandrotitti@gmail.com'
  telefono = ''
  prezzo = Faker::Commerce.price
  Announcement.create!(user_id: user_id,
                       titolo: titolo,
                       categoria: categoria,
                       descrizione: descrizione,
                       posizione: posizione,
                       regione: regione,
                       email: email,
                       telefono: telefono,
                       prezzo: prezzo)
end

2.times do |_n|
  user_id = 5
  titolo = Faker::Commerce.product_name
  categoria = 'Hobby'
  descrizione = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis pulvinar libero at volutpat.
                 Suspendisse potenti. Nullam malesuada mollis dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                 Integer leo dolor, vehicula sed sem egestas, suscipit semper magna. Nullam lacus nunc, tincidunt sed ultricies eu, luctus sed elit.
                 Fusce eu consequat magna, a euismod ante. Ut a ipsum eget risus gravida eleifend. Pellentesque porta quis urna id elementum. Integer
                 hendrerit arcu vitae nibh auctor, et feugiat sapien sollicitudin. Sed commodo, urna vel tempor congue, tortor urna laoreet lectus, et
                 tempus justo mauris ut mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  posizione = 'Torino'
  regione = 'Piemonte'
  email = 'nicol26@gmail.com'
  telefono = ''
  prezzo = Faker::Commerce.price
  Announcement.create!(user_id: user_id,
                       titolo: titolo,
                       categoria: categoria,
                       descrizione: descrizione,
                       posizione: posizione,
                       regione: regione,
                       email: email,
                       telefono: telefono,
                       prezzo: prezzo)
end

2.times do |_n|
  user_id = 7
  titolo = Faker::Commerce.product_name
  categoria = 'Giocattoli'
  descrizione = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis pulvinar libero at volutpat.
                 Suspendisse potenti. Nullam malesuada mollis dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                 Integer leo dolor, vehicula sed sem egestas, suscipit semper magna. Nullam lacus nunc, tincidunt sed ultricies eu, luctus sed elit.
                 Fusce eu consequat magna, a euismod ante. Ut a ipsum eget risus gravida eleifend. Pellentesque porta quis urna id elementum. Integer
                 hendrerit arcu vitae nibh auctor, et feugiat sapien sollicitudin. Sed commodo, urna vel tempor congue, tortor urna laoreet lectus, et
                 tempus justo mauris ut mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  posizione = 'Napoli'
  regione = 'Campania'
  email = 'franco126@gmail.com'
  telefono = ''
  prezzo = Faker::Commerce.price
  Announcement.create!(user_id: user_id,
                       titolo: titolo,
                       categoria: categoria,
                       descrizione: descrizione,
                       posizione: posizione,
                       regione: regione,
                       email: email,
                       telefono: telefono,
                       prezzo: prezzo)
end

2.times do |_n|
  user_id = 20
  titolo = Faker::Commerce.product_name
  categoria = 'Attrezzature'
  descrizione = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis pulvinar libero at volutpat.
                 Suspendisse potenti. Nullam malesuada mollis dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                 Integer leo dolor, vehicula sed sem egestas, suscipit semper magna. Nullam lacus nunc, tincidunt sed ultricies eu, luctus sed elit.
                 Fusce eu consequat magna, a euismod ante. Ut a ipsum eget risus gravida eleifend. Pellentesque porta quis urna id elementum. Integer
                 hendrerit arcu vitae nibh auctor, et feugiat sapien sollicitudin. Sed commodo, urna vel tempor congue, tortor urna laoreet lectus, et
                 tempus justo mauris ut mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  posizione = 'Roma'
  regione = 'Lazio'
  email = 'franco126@gmail.com'
  telefono = ''
  prezzo = Faker::Commerce.price
  Announcement.create!(user_id: user_id,
                       titolo: titolo,
                       categoria: categoria,
                       descrizione: descrizione,
                       posizione: posizione,
                       regione: regione,
                       email: email,
                       telefono: telefono,
                       prezzo: prezzo)
end

@annunci = Announcement.all
@annunci.each do |p|
  Question.create!(
      contenuto: "Ha segni di usura?",
      user_id: 3,
      announcement_id: p.id
    )
end

@domande = Question.all
@domande.each do |p|
  Answer.create!(
      contenuto: "è immacolato",
      user_id: 2,
      announcement_id: p.announcement_id,
      question_id: p.id
    )
end
