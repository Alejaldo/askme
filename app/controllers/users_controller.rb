class UsersController < ApplicationController
  before_action :load_user, except: [:index, :create, :new]
  before_action :authorize_user, except: [:index, :new, :create, :show]

  def index
    @users = User.all
    @hash_tags = HashTag.with_questions_only
  end

  def new
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      reset_session
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Глобалист успешно зарегистрирован с системе!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Данные глобалиста обновлены'
    else
      render 'edit'
    end
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @new_question = @user.questions.build

    @questions_count = @questions.count
    @answers_count = @questions.where.not(answer: nil).count
    @unanswered_count = @questions_count - @answers_count
  end

  def destroy
    @user.destroy
    flash[:success] = "Удаление прошло успешно!"
    redirect_to users_url
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :username, :background_color, :avatar_url)
  end

  def load_user
    @user ||= User.find params[:id]
  end

  def authorize_user
    reject_user unless @user == current_user
  end
end
