class ToppagesController < ApplicationController
  def index
    @search = Question.search(params[:q])
    @search_questions = @search.result.includes(:user).page(params[:page])
  end
end
