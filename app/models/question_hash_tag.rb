class QuestionHashTag < ApplicationRecord
  belongs_to :question
  belongs_to :hash_tag
end
