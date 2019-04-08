class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_and_belongs_to_many :hashtags

  validates :text, :user, presence: true, length: { maximum: 255 }

  before_save :set_hashtags
  after_commit :delete_independent_hashtags

  def set_hashtags
    self.hashtags = "#{text} #{answer}".
                      scan(HASHTAG_REGEX).
                      map { |ht| ht.downcase.delete('#') }.
                      uniq.
                      map { |ht| Hashtag.find_or_create_by(name: ht) }
  end

  def delete_independent_hashtags
    Hashtag.includes(:questions).where(questions: { id: nil }).destroy_all
  end
end
