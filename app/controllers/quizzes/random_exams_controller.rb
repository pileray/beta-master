class Quizzes::RandomExamsController < ApplicationController
  def show
    session[:answered_quiz_ids] ||= []

    @quiz = Quiz.find(params[:quiz_id])
    session[:answered_quiz_ids] << @quiz.id

    @next_quiz = Quiz.get_random_quiz(session)
  end

  def destroy
    session[:answered_quiz_ids] = []
    redirect_to root_path, status: :see_other
  end
end
