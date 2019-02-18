class UsersController < ApplicationController
  include Pagy::Backend

  before_action :load_user, except: [:index, :new, :create]
  before_action :redirect_current_user, only: [:new, :create]
  before_action :authorize_user, only: [:edit, :update]

  def index
    @users = User.all.order(:id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Регистрация прошла успешно'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: 'Данные обновлены'
    else
      render :edit
    end
  end

  def show
    @pagy, @questions = pagy(@user.questions.order(created_at: :desc), items: 3)
    @new_question = @user.questions.build
    @questions_count = @questions.count
    @answers_count = @questions.where.not(answer: nil).count
    @unanswered_count = @questions_count - @answers_count
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url, :bgcolor)
  end

  def load_user
    @user ||= User.find params[:id]
  end

  def authorize_user
    reject_user unless @user == current_user
  end

  def redirect_current_user
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?
  end
end
