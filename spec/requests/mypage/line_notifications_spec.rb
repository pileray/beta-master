require 'rails_helper'

RSpec.describe "Mypage::LineNotifications", type: :request do
  let!(:user) { create(:user) }
  before do
    login_user_request_spec(user)
  end

  describe "GET mypage/line_notification/edit" do
    it "通知設定ページが正常に表示される" do
      get edit_mypage_line_notification_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("LINE通知設定")
    end
  end

  describe "PATCH mypage/line_notification" do
    it "通知設定が更新されること" do
      patch mypage_line_notification_path,
            params: { user: { line_notification: false } },
            headers: { 'Accept' => 'text/vnd.turbo-stream.html' }
      expect(response).to have_http_status(200)
      expect(user.reload.line_notification).to eq(false)
    end
  end

end
