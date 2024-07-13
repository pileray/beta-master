class QuizzesController < ApplicationController
  def index
    # N+1対策を今後実施
    @quizzes = Quiz.all
  end
end
