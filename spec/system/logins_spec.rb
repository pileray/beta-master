require 'rails_helper'

RSpec.describe "Logins", type: :system do
  let!(:user) { create(:user) }
  let!(:authentication) { create(:authentication, user: user) }

  describe 'ログイン機能' do
    it 'ユーザーがログインできる' do
      login_user(user)
      visit root_path
      expect(page).to have_content('マイページ')
    end
  end
end
