class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit]
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
    @questions = @user.questions.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    puts "ここを見る"
    p params
    @user = User.find(params[:id])
    p @user
    
    if @user.update(user_params)
      flash[:success] = 'プロフィールを更新しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールの更新に失敗しました。'
      render :edit
    end
  end
  
  def answered_questions
    @user = User.find(params[:id])
    @answers = @user.answers.page(params[:page])
    @answered_questions = @user.answered_questions
    counts(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture, :plofile)
  end
end
