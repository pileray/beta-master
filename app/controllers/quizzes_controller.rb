class QuizzesController < ApplicationController
  def index
    @q = Quiz.ransack(params[:q])
    @q.sorts = 'category_name' if @q.sorts.empty?
    @quizzes = @q.result.includes(:category)
  end
end
