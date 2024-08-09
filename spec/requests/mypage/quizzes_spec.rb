require 'rails_helper'

RSpec.describe "Mypage::Quizzes", type: :request do
  let!(:user) { create(:user) }
  let!(:quiz1) { create(:quiz, body: '問題1の問題文です', answer: '回答1') }
  let!(:quiz2) { create(:quiz, body: '問題2の問題文です', answer: '回答2') }
  before do
    login_user_request_spec(user)
    user.bookmarked_quizzes << quiz1
  end

  describe "GET /index" do
    it "マイクイズ帳ページが正常に表示され、マイクイズが表示される" do
      get mypage_quizzes_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('問題1')
      expect(response.body).not_to include('問題2')
    end
  end

end
