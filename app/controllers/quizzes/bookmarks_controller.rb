class Quizzes::BookmarksController < ApplicationController
  def create
    @quiz = Quiz.find(params[:quiz_id])
    current_user.bookmark(@quiz)
    flash.now[:success] = "お気に入りに追加しました"
  end

  def destroy
    @quiz = Quiz.find(params[:quiz_id])
    current_user.unbookmark(@quiz)
    flash.now[:success] = "お気に入りから解除しました"
  end
end
