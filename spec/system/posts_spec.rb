require 'rails_helper'

RSpec.describe "Posts", type: :system do
  describe 'Capybaraのテスト実行' do
    it 'rootにアクセスしコンテンツが正しく表示される' do
      visit '/'
      expect(page).to have_content 'テストです'
    end
  end
end
