class UsersController < ApplicationController
  include Pagy::Backend

  def index
    @users = User.all.order(:id)
  end

  def new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @pagy, @questions = pagy(@user.questions.order(created_at: :desc), items: 3)
    @new_question = Question.new
  end
end
