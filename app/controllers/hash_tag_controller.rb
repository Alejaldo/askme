class HashTagController < ApplicationController
  def show
    @hash_tag = HashTag.find_by!(name: params[:id])
    @questions = @hash_tag.questions
  end
end
