class HashtagsController < ApplicationController
  include Pagy::Backend

  def show
    @hashtag = Hashtag.find_by(name: params[:name])
    @pagy, @questions = pagy(@hashtag.questions.order(created_at: :desc), items: 3)
  end
end
