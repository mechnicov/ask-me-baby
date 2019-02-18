5.times do
  name  = Faker::Name.name
  username = Faker::Internet.username(name, '_')
  email = Faker::Internet.email(name)
  password = '12345'
  User.create!(name:  name, username: username, email: email,
               password: password, password_confirmation: password)
end

users = User.all

0.upto(2) do |i|
  user = users[i]
  avatar_url = Faker::Avatar.image(i, '100x100', 'jpg')
  bgcolor = Faker::Color.hex_color
  user.update!(avatar_url: avatar_url, bgcolor: bgcolor)
  rand(1..30).times { Question.create!(text: Faker::Lorem.question, user: user) }
end
