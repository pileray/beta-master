class Quizzes::RandomExamsController < ApplicationController
  def show
    @quiz = Quiz.find(params[:quiz_id])
    @next_quiz = Quiz.get_random_quiz(session)
  end
end
