User.create!(username:  'admin',
    email: 'admin@vvc.com',
    password:              'password',
    password_confirmation: 'password',
    admin: true)

User.create!(username:  'pincopallo',
    email: 'pincopallo@gmail.com',
    password:              'password',
    password_confirmation: 'password',
    admin: false)

100.times do |n|
    username = Faker::Internet.user_name(5..20)
    email = Faker::Internet.email
    password = Faker::Internet.password(8)
    User.create!(username:  username,
        email: email,
        password:              password,
        password_confirmation: password)
end