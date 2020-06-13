class QuestionsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
