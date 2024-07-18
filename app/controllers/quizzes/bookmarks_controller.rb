class Quizzes::BookmarksController < ApplicationController
  def create
    @quiz = Quiz.find(params[:quiz_id])
    current_user.bookmark(@quiz)
  end

  def destroy
    @quiz = Quiz.find(params[:quiz_id])
    current_user.unbookmark(@quiz)
  end
end
