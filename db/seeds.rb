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

100.times do |_n|
  username = Faker::Internet.user_name(5..20)
  email = Faker::Internet.email
  password = Faker::Internet.password(8)
  User.create!(username: username,
               email: email,
               password: password,
               password_confirmation: password)
end

10.times do |_n|
  user_id = 2
  titolo = Faker::Commerce.product_name
  categoria = Faker::Commerce.department
  descrizione = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis pulvinar libero at volutpat.
                 Suspendisse potenti. Nullam malesuada mollis dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                 Integer leo dolor, vehicula sed sem egestas, suscipit semper magna. Nullam lacus nunc, tincidunt sed ultricies eu, luctus sed elit.
                 Fusce eu consequat magna, a euismod ante. Ut a ipsum eget risus gravida eleifend. Pellentesque porta quis urna id elementum. Integer
                 hendrerit arcu vitae nibh auctor, et feugiat sapien sollicitudin. Sed commodo, urna vel tempor congue, tortor urna laoreet lectus, et
                 tempus justo mauris ut mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  posizione = 'x,y,z'
  email = 'pincopallo@gmail.com'
  telefono = ''
  prezzo = Faker::Commerce.price
  Announcement.create!(user_id: user_id,
                       titolo: titolo,
                       categoria: categoria,
                       descrizione: descrizione,
                       posizione: posizione,
                       email: email,
                       telefono: telefono,
                       prezzo: prezzo)
end
