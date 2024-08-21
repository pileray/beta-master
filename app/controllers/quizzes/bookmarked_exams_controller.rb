class Quizzes::BookmarkedExamsController < ApplicationController
  before_action :require_login, only: %i[show destroy]

  def show
    session[:answered_bookmarked_quiz_ids] ||= []

    @quiz = current_user.bookmarked_quizzes.find(params[:quiz_id])
    session[:answered_bookmarked_quiz_ids] << @quiz.id

    @next_quiz = Quiz.get_bookmarked_quiz(session, current_user)
  end

  def destroy
    session[:answered_bookmarked_quiz_ids] = []
    redirect_to root_path, status: :see_other
  end
end
