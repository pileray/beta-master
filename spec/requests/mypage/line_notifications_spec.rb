require 'rails_helper'

RSpec.describe "Mypage::LineNotifications", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/mypage/line_notifications/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/mypage/line_notifications/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/mypage/line_notifications/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
