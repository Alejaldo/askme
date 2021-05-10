class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])

    if user.present?
      reset_session
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Вы успешно залогинились'
    else
      flash.now.alert = 'Неправильный email или пароль'
      render :new
    end
  end

  def destroy
    reset_session
    session[:user_id] = nil
    redirect_to root_url, notice: 'Вы разлогинились! Приходите еще!'
  end
end
