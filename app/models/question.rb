class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hash_tags
  has_many :hash_tags, through: :question_hash_tags

  validates :text, presence: true, length: { maximum: 255 }
end
