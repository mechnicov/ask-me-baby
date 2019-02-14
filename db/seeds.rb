10.times do
  name  = Faker::Name.name
  username = Faker::Internet.username(name, '_')
  email = Faker::Internet.email(name)
  password = '12345'
  User.create!(name:  name, username: username, email: email,
               password: password, password_confirmation: password)
end

users = User.all

0.upto(6) do |i|
  user = users[i]
  avatar_url = "http://zano.ru/avatar/images/100j0#{rand(100..999)}.jpg"
  user.update!(avatar_url: avatar_url)
  rand(1..100).times { Question.create!(text: Faker::Lorem.question, user: user) }
end
