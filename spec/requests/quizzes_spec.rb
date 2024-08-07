require 'rails_helper'

RSpec.describe "Quizzes", type: :request do
  describe "GET /quizzes" do
    let!(:category1) { Category.find_by(name: 'エンタメ') }
    let!(:category2) { Category.find_by(name: 'スポーツ') }
    let!(:quiz1) { create(:quiz, body: '問題1の問題文です', answer: '回答1', category: category1) }
    let!(:quiz2) { create(:quiz, body: '問題2の問題文です', answer: '回答2', category: category2) }

    it "クイズ一覧を取得する" do
      get quizzes_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('問題1')
      expect(response.body).to include('問題2')
    end

    it "カテゴリーでフィルタリングする" do
      get quizzes_path, params: { q: { category_name_eq: 'エンタメ' } }
      expect(response).to have_http_status(200)
      expect(response.body).to include('問題1')
      expect(response.body).not_to include('問題2')
    end

    it "キーワードで検索する" do
      get quizzes_path, params: { q: { body_or_answer_cont: '問題1' } }
      expect(response).to have_http_status(200)
      expect(response.body).to include('問題1')
      expect(response.body).not_to include('問題2')
    end
  end
end
