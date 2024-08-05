class Mypage::QuizzesController < Mypage::BaseController
  def index
    @q = current_user.bookmarked_quizzes.ransack(params[:q])
    @q.sorts = 'category_name' if @q.sorts.empty?
    @quizzes = @q.result.includes(:category)
  end
end
