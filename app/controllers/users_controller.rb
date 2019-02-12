class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Bob Marley',
        username: 'rastaman',
        avatar_url: 'http://zano.ru/avatar/images/100j1209.jpg'
      ),
      User.new(id: 2, name: 'Антон', username: 'chehov')
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Bob Marley',
      username: 'rastaman',
      avatar_url: 'http://zano.ru/avatar/images/100j1209.jpg'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('11.02.2019')),
      Question.new(text: 'Что случилось?', created_at: Date.parse('12.02.2019'))
    ]

    @new_question = Question.new
  end
end
