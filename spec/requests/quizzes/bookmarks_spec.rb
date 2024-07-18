require 'rails_helper'

RSpec.describe "Quizzes::Bookmarks", type: :request do
  describe "POST /quizzes/:quiz_id/bookmark" do
    let!(:user) { create(:user) }
    let!(:quiz) { Quiz.first }
    before do
      login_user_request_spec(user)
    end

    it "リクエストが成功すること" do
      post quiz_bookmark_path(quiz.id), headers: { 'Accept' => 'text/vnd.turbo-stream.html' }
      expect(response).to have_http_status(200)
    end

    it "お気に入り登録ができること" do
      expect {
        post quiz_bookmark_path(quiz.id), headers: { 'Accept' => 'text/vnd.turbo-stream.html' }
      }.to change { user.bookmarks.count }.by(1)
    end
  end

  describe "DELETE /quizzes/:quiz_id/bookmark" do
    let!(:user) { create(:user) }
    let!(:quiz) { Quiz.first }
    before do
      login_user_request_spec(user)
      user.bookmark(quiz)
    end

    it "リクエストが成功すること" do
      delete quiz_bookmark_path(quiz.id), headers: { 'Accept' => 'text/vnd.turbo-stream.html' }
      expect(response).to have_http_status(200)
    end

    it "お気に入り解除ができること" do
      expect {
        delete quiz_bookmark_path(quiz.id), headers: { 'Accept' => 'text/vnd.turbo-stream.html' }
      }.to change { user.bookmarks.count }.by(-1)
    end
  end
end
