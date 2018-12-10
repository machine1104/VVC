User.create!(username:  'admin',
    email: 'admin@vvc.com',
    password:              'password',
    password_confirmation: 'password',
    comune: 'NY',
    data_nascita: '1989-12-24',
    admin: true)

100.times do |n|
    username = Faker::Internet.user_name(5..20)
    email = Faker::Internet.email
    password = Faker::Internet.password(8)
    comune = Faker::Address.city
    data_nascita = Faker::Date.birthday(18)
    User.create!(username:  username,
        email: email,
        password:              password,
        password_confirmation: password,
        comune: comune,
        data_nascita: data_nascita)
end