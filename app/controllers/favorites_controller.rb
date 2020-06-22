class FavoritesController < ApplicationController
  def create
    answer = Answer.find(params[:answer_id])
    current_user.favorite(answer)
    flash[:success] = "お気に入りに追加しました"
    redirect_to current_user
  end

  def destroy
    answer = Answer.find(params[:answer_id])
    current_user.unfavorite(answer)
    flash[:success] = "お気に入りから削除しました"
    redirect_to current_user
  end
end
