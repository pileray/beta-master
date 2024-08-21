require 'rails_helper'

RSpec.describe LineNotificationsJob, type: :job do
  include ActiveJob::TestHelper

  describe 'line_notification_job' do
    before do
      allow(Quiz).to receive(:get_notification_quiz).and_return(quiz)
      allow_any_instance_of(LineNotificationsJob).to receive(:client).and_return(line_client)
    end

    let!(:user1) { create(:user, line_notification: true) }
    let!(:user2) { create(:user, line_notification: false) }
    let!(:user3) { create(:user, line_notification: true) }
    let!(:quiz) { Quiz.find_by!(body: '問題1の問題文です') }
    let!(:line_client) { instance_double(Line::Bot::Client, push_message: double(:response, success?: true)) }

    it 'userのline_notificationがtrueの場合Line通知を送信する' do

      expected_text = <<~TEXT.chomp
        【今日のクイズ🌤】

        問題【#{quiz.decorate.truncated_body}/】

        おはようございます！本日のクイズです！この読ませ押し、分かりますか？👀

        回答はコチラ💡

        https://#{Settings.default_url_options.host}/quizzes/#{quiz.id}/random_exam?openExternalBrowser=1
      TEXT

      perform_enqueued_jobs do
        LineNotificationsJob.perform_later
      end

      expect(line_client).to have_received(:push_message).with(user1.line_authentication.uid, { type: 'text', text: expected_text })
      expect(line_client).not_to have_received(:push_message).with(user2.line_authentication.uid, { type: 'text', text: expected_text })
      expect(line_client).to have_received(:push_message).with(user3.line_authentication.uid, { type: 'text', text: expected_text })
    end
  end
end
