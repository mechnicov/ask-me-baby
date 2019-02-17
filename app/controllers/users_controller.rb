class UsersController < ApplicationController
  include Pagy::Backend

  before_action :load_user, except: [:index, :new, :create]

  def index
    @users = User.all.order(:id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'Пользователь успешно зарегистрирован!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: 'Данные обновлены'
    else
      render 'edit'
    end
  end

  def show
    @pagy, @questions = pagy(@user.questions.order(created_at: :desc), items: 3)
    @new_question = @user.questions.build
  end

  private

  def load_user
    @user ||= User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url)
  end
end
