class HashTagsController < ApplicationController
  def show
    @hash_tag = HashTag.with_questions_only.find_by!(name: params[:name])
    @questions = @hash_tag.questions
  end
end
