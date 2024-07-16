require 'rails_helper'

RSpec.describe "Quizzes", type: :request do
  describe "GET /quizzes" do
    it "クイズ一覧を取得する" do
      get quizzes_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include('問題1')
      expect(response.body).to include('問題2')
    end

    it "カテゴリーでフィルタリングする" do
      get quizzes_path, params: { q: { category_name_eq: 'エンタメ' } }
      expect(response).to have_http_status(:success)
      expect(response.body).to include('問題1')
      expect(response.body).not_to include('問題2')
    end

    it "回答を表示する" do
      get quizzes_path
      expect(response.body).to include('回答表示')
    end

    it "キーワードで検索する" do
      get quizzes_path, params: { q: { body_or_answer_cont: '問題1' } }
      expect(response).to have_http_status(:success)
      expect(response.body).to include('問題1')
      expect(response.body).not_to include('問題2')
    end
  end
end
