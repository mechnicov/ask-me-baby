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
    @questions = @user.questions
    @new_question = Question.new
  end
end
