# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#bookmark' do
    let!(:user) { create(:user) }
    let!(:quiz) { Quiz.first }

    it 'お気に入り登録ができること' do
      expect {
        user.bookmark(quiz)
      }.to change { user.bookmarks.count }.by(1)
    end
  end

  describe '#unbookmark' do
    let!(:user) { create(:user) }
    let!(:quiz) { Quiz.first }

    it 'お気に入り解除ができること' do
      user.bookmark(quiz)
      expect {
        user.unbookmark(quiz)
      }.to change { user.bookmarks.count }.by(-1)
    end
  end

  describe '#bookmark?' do
    let!(:user) { create(:user) }
    let!(:quiz) { Quiz.first }

    context 'お気に入り登録している場合' do
      before { user.bookmark(quiz) }

      it 'trueを返すこと' do
        expect(user.bookmark?(quiz)).to eq true
      end
    end

    context 'お気に入り登録していない場合' do
      it 'falseを返すこと' do
        expect(user.bookmark?(quiz)).to eq false
      end
    end
  end
end
