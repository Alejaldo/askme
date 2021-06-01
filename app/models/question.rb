class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hash_tags
  has_many :hash_tags, through: :question_hash_tags

  validates :text, presence: true, length: { maximum: 255 }

  after_commit :create_hash_tags, on: :create

  def create_hash_tags
    extract_hash_tags.each do |name|
      hash_tags.create(name: name)
    end
  end

  def extract_hash_tags
    question_parts = [text, answer].map do |question_part|
      question_part.scan(/#[[:word:]]+/).map{ |text| text.gsub("#", "") }
    end
    question_parts[0] + question_parts[1]
  end
end
