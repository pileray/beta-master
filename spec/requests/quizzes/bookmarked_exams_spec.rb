require 'rails_helper'

RSpec.describe "Quizzes::BookmarkedExams", type: :request do
  let!(:user) { create(:user) }
  let!(:quiz1) { Quiz.find_by!(body: '問題1の問題文です') }
  let!(:quiz2) { Quiz.find_by!(body: '問題2の問題文です') }
  before do
    login_user_request_spec(user)
    user.bookmarked_quizzes << [quiz1, quiz2]
  end

  describe "GET /quizzes/:quiz_id/bookmarked_exam" do
    it 'クイズを取得し、answered_bookmarked_quiz_idsセッションに追加する' do
      get quiz_bookmarked_exam_path(quiz1)
      expect(response).to have_http_status(:success)
      expect(session[:answered_bookmarked_quiz_ids]).to include quiz1.id
    end
  end

  describe "DELETE /quizzes/bookmarked_exam" do
    it "answered_bookmarked_quiz_idsセッションをリセットし、rootパスにsee_otherステータスでリダイレクトする" do
      get quiz_bookmarked_exam_path(quiz1)
      expect(response).to have_http_status(:success)
      expect(session[:answered_bookmarked_quiz_ids]).to include quiz1.id
      delete quizzes_bookmarked_exam_path
      expect(session[:answered_bookmarked_quiz_ids]).to be_empty
      expect(response).to redirect_to(root_path)
      expect(response).to have_http_status(:see_other)
    end
  end
end
