require 'rails_helper'

RSpec.describe "Mypage::Accounts", type: :request do
  let!(:user) { create(:user) }
  let!(:quiz1) { create(:quiz, body: '問題1の問題文です', answer: '回答1') }
  let!(:quiz2) { create(:quiz, body: '問題2の問題文です', answer: '回答2') }
  before do
    login_user_request_spec(user)
  end

  describe "GET /edit" do
    it "ユーザー退会ページが正常に表示される" do
      get edit_mypage_account_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("ユーザー退会")
    end
  end

end
