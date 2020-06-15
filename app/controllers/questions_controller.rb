class QuestionsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @questions = Question.all.order(id: :desc).page(params[:page])
  end

  def show
    @question = Question.find_by(id: params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    
    if @question.save
      flash[:success] = '質問を投稿しました。'
      redirect_to @question
    else
      flash.now[:danger] = '質問の投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    
    if @question.update(question_params)
      flash[:success] = '質問はに更新されました'
      redirect_to @question
    else
      flash.now[:danger] = '質問は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    
    flash[:success] = '質問は正常に削除されました'
    redirect_to questions_url
  end
  
  private
  
  def question_params
    params.require(:question).permit(:content)
  end
end
