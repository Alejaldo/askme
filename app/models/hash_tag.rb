class HashTag < ApplicationRecord
  has_many :question_hash_tags, dependent: :destroy
  has_many :questions, through: :question_hash_tags
end
