class SearchController < ApplicationController
  def index
    if params[:query].start_with?('#')
      query  = params[:query].gsub('#', '')
      @question = Question.joins(:hash_tags).where(hash_tags: {name: query})
    else
      @question = Question.where("(text like ?) OR (answer like ?)", "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end
end
