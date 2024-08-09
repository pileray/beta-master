class Quizzes::BookmarksController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @quiz = Quiz.find(params[:quiz_id])
    current_user.bookmark(@quiz)
    flash.now[:success] = 'マイクイズ帳に追加しました'
  end

  def destroy
    @quiz = Quiz.find(params[:quiz_id])
    current_user.unbookmark(@quiz)
    flash.now[:success] = 'マイクイズ帳から削除しました'
  end
end
