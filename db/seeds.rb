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
  fontcolor = Faker::Color.hex_color
  bordercolor = Faker::Color.hex_color
  user.update!(avatar_url: avatar_url, bgcolor: bgcolor, fontcolor: fontcolor, bordercolor: bordercolor)
  unless i == 2
    rand(50..100).times do
      answers = [nil, Faker::Lorem.sentence]
      Question.create!(text: text = Faker::Lorem.question, answer: answers.sample,
                       user: user, author: users.sample)
    end
  else
    Question.create!(text: text = Faker::Lorem.question, user: user)
  end
end
