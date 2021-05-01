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
      Question.new(text: 'Как жизнь?', created_at: Date.parse('11.04.2021')),
      Question.new(text: 'Сколько $ стоит должность конгрессмена?', created_at: Date.parse('12.04.2021')),
      Question.new(text: 'Вы действительно брали ипотеку на ремонт своих аппартаментов?', created_at: Date.parse('13.04.2021')),
      Question.new(text: 'Ну что, когда введем цифровой концлагерь?', created_at: Date.parse('15.04.2021')),
      Question.new(text: 'Какого быть из рода Спенсеров?', created_at: Date.parse('17.04.2021')),
      Question.new(text: 'Готовы идти на новый срок?', created_at: Date.parse('19.04.2021')),
      Question.new(text: 'Давали уже советы по Амерекситу?', created_at: Date.parse('20.04.2021')),
      Question.new(text: 'Где услуги лоббистов дешевле?', created_at: Date.parse('22.04.2021')),
      Question.new(text: 'Ждете воцарение Уильяма?', created_at: Date.parse('23.04.2021')),
      Question.new(text: 'Вы лично ждете Даджаля в Айят-Софии?', created_at: Date.parse('25.04.2021')),
      Question.new(text: 'Как Вам удается продвигать Румский проект?', created_at: Date.parse('27.04.2021')),
      Question.new(text: 'Расскажите о Вашей бурной молодости времен Балингтон клаб?', created_at: Date.parse('29.04.2021')),
      Question.new(text: 'А вы лично нарушали регламент своего же локудауна?', created_at: Date.parse('30.04.2021'))
    ]

    @new_question = Question.new
  end
end
