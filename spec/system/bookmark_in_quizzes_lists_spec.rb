require 'rails_helper'

RSpec.describe "BookmarkInQuizzesLists", type: :system do
  let!(:user) { create(:user) }
  let!(:quiz) { Quiz.first }

  before do
    login_user_system_spec(user)
  end

  describe 'お気に入り登録' do
    it 'クイズをお気に入り登録できること' do
      visit quizzes_path
      expect {
        within "#bookmark_quiz_#{quiz.id}" do
          find('.btn-bookmark').click
        end
        sleep 0.1
      }.to change { user.bookmarks.count }.by(1)
    end
  end

  describe 'お気に入り解除' do
    before do
      user.bookmark(quiz)
    end

    it 'クイズをお気に入り解除できること' do
      visit quizzes_path
      expect {
        within "#bookmark_quiz_#{quiz.id}" do
          find('.btn-unbookmark').click
        end
        sleep 0.1
      }.to change { user.bookmarks.count }.by(-1)
    end
  end
end
