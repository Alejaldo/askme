class HashTagController < ApplicationController
  suka = rescue_from ActiveRecord::RecordNotFound do |exception|
    @exception = params[:id]
    render partial: "hash_tag/exception", as: @exception
  end

  def show
    @hash_tag = HashTag.find_by!(name: params[:id])
    @questions = @hash_tag.questions
    suka
  end
end
