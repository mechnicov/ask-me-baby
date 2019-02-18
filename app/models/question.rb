class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  validates :text, :user, presence: true, length: { maximum: 255 }
end
