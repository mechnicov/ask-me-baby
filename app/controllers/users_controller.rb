class UsersController < ApplicationController
  def index
    @users = User.all.order(:id)
  end

  def new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    @new_question = Question.new
  end
end
