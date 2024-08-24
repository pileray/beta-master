class Quizzes::BookmarkedExamsController < ApplicationController
  before_action :require_login, only: %i[show destroy]

  def show
    session[:answered_bookmarked_quiz_ids] ||= []

    quiz = Quiz.find(params[:quiz_id])

    if current_user.bookmark?(quiz)
      @quiz = quiz
    elsif current_user.bookmarked_quizzes.exists?
      @quiz = Quiz.get_bookmarked_quiz(session, current_user)
    else
      flash[:error] = 'マイクイズ帳にクイズがありません！クイズを登録してください'
      redirect_to quizzes_path
      return
    end

    session[:answered_bookmarked_quiz_ids] << @quiz.id

    @next_quiz = Quiz.get_bookmarked_quiz(session, current_user)
  end

  def destroy
    session[:answered_bookmarked_quiz_ids] = []
    redirect_to root_path, status: :see_other
  end
end
