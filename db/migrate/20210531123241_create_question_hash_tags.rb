class CreateQuestionHashTags < ActiveRecord::Migration[6.1]
  def change
    create_table :question_hash_tags do |t|
      t.belongs_to :question, index: true
      t.belongs_to :hash_tag, index: true

      t.timestamps
    end
  end
end
