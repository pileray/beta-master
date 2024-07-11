require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "DELETE /logout" do
    let!(:user) { create(:user) }
    let!(:authentication) { create(:authentication, user: user) }

    before do
      login_user_request_spec(user)
    end

    it "ログアウトし、root_pathへリダイレクトする" do
      delete logout_path

      expect(response).to redirect_to(root_path)
      expect(flash[:success]).to eq('ログアウトしました')
      expect(response).to have_http_status(:see_other)
    end
  end
end
