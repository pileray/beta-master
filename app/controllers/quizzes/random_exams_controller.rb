class Quizzes::RandomExamsController < ApplicationController
  def show
    @quiz = Quiz.find(params[:quiz_id])
  end
end
