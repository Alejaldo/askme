class HashTagsController < ApplicationController
  def show
    @hash_tag = HashTag.where_exists(:questions).find_by!(params[:name])
    @questions = @hash_tag.questions
  end
end
