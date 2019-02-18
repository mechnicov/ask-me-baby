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
  text = Faker::Lorem.question
  unless i == 2
    rand(20..50).times { Question.create!(text: text, user: user, author: users.sample) }
  else
    Question.create!(text: text, user: user)
  end
end
