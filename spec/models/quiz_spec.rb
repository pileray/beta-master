# == Schema Information
#
# Table name: quizzes
#
#  id         :bigint           not null, primary key
#  answer     :string           not null
#  body       :text             not null
#  offset     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Quiz, type: :model do
  let!(:session) { {} }
  let!(:user) { create(:user) }
  let!(:quiz1) { Quiz.find_by!(body: '問題1の問題文です') }
  let!(:quiz2) { Quiz.find_by!(body: '問題2の問題文です') }
  let!(:quiz3) { Quiz.find_by!(body: '問題3の問題文です') }

  describe '#get_random_quiz' do
    it 'クイズをランダムに取得する' do
      quiz_ids = Quiz.pluck(:id)
      quiz = Quiz.get_random_quiz(session)
      expect(quiz_ids).to include quiz.id
    end

    it '回答済みのクイズは取得しない' do
      session[:answered_quiz_ids] = [quiz1.id, quiz2.id]
      quiz = Quiz.get_random_quiz(session)
      expect(quiz.id).to eq quiz3.id
    end

    it '全てのクイズが回答済みの場合、回答済みのクイズをリセットする' do
      session[:answered_quiz_ids] = Quiz.pluck(:id)
      quiz = Quiz.get_random_quiz(session)
      expect(session[:answered_quiz_ids]).to be_empty
    end
  end

  describe '#get_bookmarked_quiz' do
    it 'お気に入りされたクイズを取得する' do
      user.bookmark(quiz1)
      quiz = Quiz.get_bookmarked_quiz(session, user)
      expect(quiz).to eq quiz1
    end

    it '回答済みのお気に入りされたクイズは取得しない' do
      user.bookmarked_quizzes << [quiz1, quiz2, quiz3]
      session[:answered_bookmarked_quiz_ids] = [quiz1.id, quiz2.id]
      quiz = Quiz.get_bookmarked_quiz(session, user)
      expect(quiz).to eq quiz3
    end

    it '全てのお気に入りされたクイズが回答済みの場合、回答済みのクイズをリセットする' do
      user.bookmarked_quizzes << [quiz1, quiz2, quiz3]
      session[:answered_bookmarked_quiz_ids] = user.bookmarked_quizzes.pluck(:id)
      quiz = Quiz.get_bookmarked_quiz(session, user)
      expect(session[:answered_bookmarked_quiz_ids]).to be_empty
    end
  end
end
