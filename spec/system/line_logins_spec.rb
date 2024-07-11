# [WIP]omniauthのテスト作成予定
# require 'rails_helper'

# RSpec.describe "LineLogins", type: :system do
#   before do
#     mock_line_auth_hash
#     Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:line]
#   end

#   describe 'LINE連携機能' do
#     context '新規登録ユーザーの場合' do
#       it '登録完了後、登録完了ページが表示される' do
#         visit root_path
#         click_link 'LINE連携'
#         expect(page).to have_content('BetaMasterへようこそ！')
#         expect(page).to have_content('マイページ')
#       end
#     end

#     context '既登録ユーザーの場合' do
#       let!(:user) { create(:user) }
#       before do
#         create(:authentication, user: user, provider: 'line', uid: '123545')
#       end
#       it 'ログイン後、トップページが表示される' do
#         visit root_path
#         click_link 'LINE連携'
#         expect(page).to have_content('マイページ')
#         expect(page).to have_content('Strengthen your BetaQuiz.')
#       end
#     end
#   end
# end
