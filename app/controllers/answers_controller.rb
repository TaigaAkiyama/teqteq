class AnswersController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      flash[:success] = '回答しました。'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = '回答に失敗しました。'
      render 'questions/index'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    
    if @answer.destroy
     flash[:success] = '回答を削除しました。'
     redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def answer_params
    params.require(:answer).permit(:body, :picture).merge(user_id: current_user.id, question_id: params[:question_id])
  end
  
  def correct_user
    @answer = current_user.answers.find_by(id: params[:id])
    unless @manswer
      redirect_to root_url
    end
  end
end
