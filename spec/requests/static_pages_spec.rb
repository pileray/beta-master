require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /" do
    it "トップページが正常に表示される" do
      get root_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("Strengthen your BetaQuiz.")
    end
  end

  describe "GET /complete_signup" do
    it "サインアップ完了ページが正常に表示される" do
      get complete_signup_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("BetaMasterへようこそ！")
    end
  end
end
