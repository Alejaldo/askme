class UsersController < ApplicationController
  def index
    # Создаём массив из двух болванок пользователей. Вызываем метод # User.new, который создает модель, не записывая её в базу.
    # У каждого юзера мы прописали id, чтобы сымитировать реальную
    # ситуацию – иначе не будет работать хелпер путей
    @users = [
      User.new(
        id: 1,
        name: 'Boris',
        username: 'bojo',
        avatar_url: 'https://pbs.twimg.com/profile_images/1331215386633756675/NodbPVQv_400x400.jpg'
      ),
      User.new(
        id: 2,
        name: 'Barak',
        username: 'obama'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Boris',
      username: 'bojo',
      avatar_url: 'https://pbs.twimg.com/profile_images/1331215386633756675/NodbPVQv_400x400.jpg'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('27.03.2016'))
    ]

    @new_question = Question.new
  end
end
