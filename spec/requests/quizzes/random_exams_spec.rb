require 'rails_helper'

RSpec.describe "Quizzes::RandomExams", type: :request do
  let!(:quiz1) { create(:quiz) }
  let!(:quiz2) { create(:quiz) }

  describe "GET /quizzes/:quiz_id/random_exam" do
    it 'クイズを取得し、answered_quiz_idsセッションに追加する' do
      get quiz_random_exam_path(quiz1)
      expect(response).to have_http_status(200)
      expect(session[:answered_quiz_ids]).to include quiz1.id
      expect(session[:answered_quiz_ids]).not_to include quiz2.id
    end
  end

  describe "DELETE /quizzes/random_exam" do
    it "answered_quiz_idsセッションをリセットし、rootパスにsee_otherステータスでリダイレクトする" do
      get quiz_random_exam_path(quiz1)
      delete quizzes_random_exam_path
      expect(session[:answered_quiz_ids]).to be_empty
      expect(response).to redirect_to(root_path)
      expect(response).to have_http_status(:see_other)
    end
  end
end
