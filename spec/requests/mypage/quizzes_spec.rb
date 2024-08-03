require 'rails_helper'

RSpec.describe "Mypage::Quizzes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/mypage/quizzes/index"
      expect(response).to have_http_status(:success)
    end
  end

end
