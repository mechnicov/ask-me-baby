class Question < ApplicationRecord
  HASHTAG_REGEX = /#[[:word:]-]+/.freeze

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_and_belongs_to_many :hashtags

  validates :text, :user, presence: true, length: { maximum: 255 }

  before_save :set_hashtags
  after_comit :delete_independent_hashtags

  def set_hashtags
    self.hashtags = (self.text.scan(HASHTAG_REGEX) + self.answer.scan(HASHTAG_REGEX).
                      uniq(&:downcase).
                      map { |ht| Hashtag.find_or_create_by(name: ht.delete('#')) }
  end

  def delete_independent_hashtags
    Hashtag.includes(:questions).where(questions: { id: nil }).destroy_all
  end
end
