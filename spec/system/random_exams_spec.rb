require 'rails_helper'

RSpec.describe "RandomExams", type: :system do
  let!(:quiz1) { Quiz.find_by!(body: '問題1の問題文です') }
  let!(:quiz2) { Quiz.find_by!(body: '問題2の問題文です') }
  let!(:quiz3) { Quiz.find_by!(body: '問題3の問題文です') }

  describe '問題が表示され、回答と問題文追加ができる' do
    it '問題文が表示され、回答と問題文追加ができる' do
      visit quiz_random_exam_path(quiz1)
      sleep 0.5

      expect(page).to have_content('問題')
      expect(page).to have_content('回答表示')

      click_button '5文字追加'
      expect(page).to have_content('問題1の問題文')

      click_button '全文表示'
      expect(page).to have_content('問題1の問題文です')

      find('p#show-answer').click
      expect(page).to have_content('回答1')
    end
  end
end
