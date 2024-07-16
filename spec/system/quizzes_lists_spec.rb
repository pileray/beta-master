require 'rails_helper'

RSpec.describe "QuizzesLists", type: :system do
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
