class Quizzes::RandomExamsController < ApplicationController
  def show
    @quiz = Quiz.find(params[:quiz_id])
    @next_quiz = Quiz.get_random_quiz(session)
  end

  def destroy
    session[:answered_quiz_ids] = []
    redirect_to root_path, status: :see_other
  end
end
