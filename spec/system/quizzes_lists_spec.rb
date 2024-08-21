require 'rails_helper'

RSpec.describe "QuizzesLists", type: :system do
  let!(:category1) { Category.find_by(name: 'エンタメ') }
  let!(:category2) { Category.find_by(name: 'スポーツ') }
  let!(:quiz1) { create(:quiz, body: '問題1の問題文です', answer: '回答1', category: category1) }
  let!(:quiz2) { create(:quiz, body: '問題2の問題文です', answer: '回答2', category: category2) }

  it 'クイズ一覧を表示する' do
    visit quizzes_path

    expect(page).to have_content('問題1')
    expect(page).to have_content('問題2')
  end

  it 'カテゴリーでフィルタリングできる' do
    visit quizzes_path
    find_link('エンタメ', match: :first).click

    expect(page).to have_content('問題1')
    expect(page).not_to have_content('問題2')
  end

  it '回答を表示する' do
    visit quizzes_path
    find('span', text: '回答表示', match: :first).click

    expect(page).to have_content('回答1')
  end

  it 'キーワードで検索できる' do
    visit quizzes_path
    fill_in 'q_body_or_answer_cont', with: '問題1'

    expect(page).to have_content('問題1')
    expect(page).not_to have_content('問題2')
  end
end
