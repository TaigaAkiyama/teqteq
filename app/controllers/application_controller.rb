class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  before_action :set_search
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_questions = user.questions.count
    @count_answered_questions = user.answered_questions.count
  end
  
  def set_search
    @search = Question.ransack(params[:q])
    @search_questions = @search.result
  end
end
