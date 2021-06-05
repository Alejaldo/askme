class Question < ApplicationRecord
  HASHTAG_FORMAT = /#[[:word:]]+/

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hash_tags, dependent: :destroy
  has_many :hash_tags, through: :question_hash_tags

  validates :text, presence: true, length: { maximum: 255 }

  after_commit :create_hash_tags, on: %i[create update]

  def create_hash_tags
    question_hash_tags.clear

    extract_hash_tags.each do |tag|
      hash_tags << HashTag.find_or_create_by(name: tag.delete('#'))
    end
  end

  def extract_hash_tags
    "#{text} #{answer}".downcase.scan(HASHTAG_FORMAT).uniq
  end

  def linked_hash_tags
    "#{text} #{answer}".gsub(HASHTAG_FORMAT) { |tag| link_to tag, hash_tag_path(tag.delete('#').downcase) }
  end
end
