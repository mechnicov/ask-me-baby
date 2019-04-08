class HashtagsController < ApplicationController
  include Pagy::Backend

  def show
    @hashtag = Hashtag.find_by(name: params[:name])
    if @hashtag
      @pagy, @questions = pagy(@hashtag.questions.order(created_at: :desc), items: 3)
    else
      redirect_to root_url, notice: I18n.t('controllers.hashtags.not_found', ht: params[:name])
    end
  end
end
