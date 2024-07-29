require 'rails_helper'

RSpec.describe "Quizzes::RandomExams", type: :request do
  let!(:quiz1) { Quiz.find_by!(body: '問題1の問題文です') }
  let!(:quiz2) { Quiz.find_by!(body: '問題2の問題文です') }
  let!(:quiz3) { Quiz.find_by!(body: '問題3の問題文です') }

  describe "GET /quizzes/:quiz_id/random_exam" do
    it 'クイズを取得し、answered_quiz_idsセッションに追加する' do
      get quiz_random_exam_path(quiz1)
      expect(response).to have_http_status(:success)
      expect(session[:answered_quiz_ids]).to include quiz1.id
    end
  end

  describe "DELETE /quizzes/random_exam" do
    it "answered_quiz_idsセッションをリセットし、rootパスにsee_otherステータスでリダイレクトする" do
      get quiz_random_exam_path(quiz1)
      expect(response).to have_http_status(:success)
      expect(session[:answered_quiz_ids]).to include quiz1.id
      delete quizzes_random_exam_path
      expect(session[:answered_quiz_ids]).to be_empty
      expect(response).to redirect_to(root_path)
      expect(response).to have_http_status(:see_other)
    end
  end
end
