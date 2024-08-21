# [WIP]omniauthを利用したLINE連携のテスト作成予定
# require 'rails_helper'

# RSpec.describe "Oauths", type: :request do
#   before do
#     OmniAuth.config.test_mode = true
#     mock_line_auth_hash
#     Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:line]
#   end

#   describe 'LINE連携機能' do
#     context '新規登録ユーザーの場合' do
#       it '登録完了後、登録完了ページが表示される' do
#         expect {
#           get auth_at_provider_path(provider: :line), params: { provider: 'line' }
#         }.to change(User, :count).by(1)
#         follow_redirect!
#         expect(response.body).to include("BetaMasterへようこそ！")
#       end
#     end

#     context '既登録ユーザーの場合' do
#       let!(:user) { create(:user) }
#       before do
#         create(:authentication, user: user, provider: 'line', uid: '123545')
#       end
#       it 'ログイン後、トップページが表示される' do
#         get auth_at_provider_path(provider: :line), params: { provider: 'line' }
#         follow_redirect!
#         expect(response.body).to include("マイページ")
#       end
#     end
#   end
# end
