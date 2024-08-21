require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "DELETE /users/:id" do
    let(:user) { create(:user) }
    before do
      login_user_request_spec(user)
    end

    it "ユーザーを削除する" do
      expect { delete user_path(user) }.to change(User, :count).by(-1)
      expect(response).to redirect_to(root_path)
      expect(response).to have_http_status(:see_other)
    end
  end
end
