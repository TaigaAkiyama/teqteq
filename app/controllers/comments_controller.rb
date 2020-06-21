class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end
  
  def show
  end
  
  def new
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comment.new(commnt_params)
    if @comment.save
      flash[:success] = "コメントを投稿しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, answer_id: params[:answer_id])
  end
end
